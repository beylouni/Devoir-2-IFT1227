------------------------------------------------
--                                            --
--            DEVOIR 2 - IFT1227              --
-- Luciano Beylouni / Maxime Davidson-Longpré --
--                                            --
------------------------------------------------

-- CODAGE DE L'ÉCLAIRAGE AUTOMATIQUE EN VHDL


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LightingControl is
    Port ( P : in STD_LOGIC;   -- Détecteur de Présence (1 si présence, 0 sinon)
        S : in STD_LOGIC;   -- Interrupteur Manuel (1 si activé, 0 sinon)
        L : out STD_LOGIC   -- Commande d'Éclairage (1 pour allumé, 0 pour éteint)
        );
end LightingControl;

architecture Behavioral of LightingControl is
    type State_Type is (Initial, PresenceDetected, LightOn, LightOff);
    signal State, Next_State : State_Type;

    constant Time_Period : time := 100 ms;  -- Durée d'un cycle en unités de temps (à ajuster)

    signal Timer : time := 0 ms;

begin
    process (P, S, State)
    begin
        Next_State <= State;  -- Par défaut, l'état suivant est le même que l'état actuel

        case State is
            when Initial =>
                if P = '1' then
                    if S = '1' then
                        Next_State <= LightOn;  -- Présence détectée, éclairage forcé
                    else
                        Next_State <= PresenceDetected;  -- Présence détectée, éclairage automatique
                    end if;
                end if;

            when PresenceDetected =>
                if P = '0' then
                    Timer <= 0;  -- Réinitialise le compteur lorsque la présence disparaît
                    Next_State <= LightOff;
                else
                    if S = '1' then
                        Next_State <= LightOn;  -- Présence détectée, éclairage forcé
                    end if;
                end if;

            when LightOn =>
                if P = '0' then
                    Timer <= 0;
                    Next_State <= LightOff;  -- La présence n'est plus détectée
                end if;

            when LightOff =>
                if P = '1' then
                    Timer <= 0;  -- Réinitialise le compteur si la présence est de nouveau détectée
                    if S = '1' then
                        Next_State <= LightOn;  -- Présence détectée, éclairage forcé
                    end if;
                else
                    if Timer < Time_Period then
                        Timer <= Timer + 1;  -- Incrémente le compteur
                        Next_State <= LightOff;  -- Maintient l'éclairage allumé
                    else
                        Next_State <= Initial;  -- Le compteur a atteint la durée spécifiée, éteint l'éclairage
                    end if;
                end if;

            when others =>
                Next_State <= Initial;  -- Retour à l'état initial en cas d'état inconnu
        end case;
    end process;

    process (State)
    begin
        case State is
            when LightOn =>
                L <= '1';  -- Allume l'éclairage
            when others =>
                L <= '0';  -- Éteint l'éclairage
        end case;
    end process;

    process
    begin
        wait for 1;  -- Attente pour simuler le passage du temps
        if State /= Initial then
            Timer <= Timer + 1;  -- Incrémente le compteur de temps
        end if;
    end process;
end Behavioral;
