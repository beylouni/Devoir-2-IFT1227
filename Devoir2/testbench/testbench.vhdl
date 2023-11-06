library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Test_LightingControl is
end Test_LightingControl;

architecture behavior of Test_LightingControl is
    signal P, S, L : STD_LOGIC;
    signal Clock : STD_LOGIC := '0';
    constant Clock_Period : time := 10 ns;  -- Période du signal d'horloge

begin
    -- Instance de l'unité sous test (UUT)
    UUT: entity work.LightingControl
        port map (P, S, L);

    -- Processus pour générer le signal d'horloge
    process
    begin
        while now < 100 ms loop
            Clock <= not Clock;
            wait for Clock_Period / 2;
        end loop;
        wait;
    end process;

    -- Processus pour tester le comportement de l'unité sous test (UUT)
    process
    begin
        P <= '0';  -- Aucune présence
        S <= '0';  -- Éclairage automatique
        wait for 5 ms;

        P <= '1';  -- Présence détectée
        S <= '0';  -- Éclairage automatique
        wait for 2 ms;

        P <= '1';  -- Présence détectée
        S <= '1';  -- Éclairage forcé
        wait for 3 ms;

        P <= '1';  -- Présence détectée
        S <= '0';  -- Éclairage automatique
        wait for 4 ms;

        P <= '0';  -- Pas de présence
        S <= '0';  -- Éclairage automatique
        wait for 3 ms;

        P <= '0';  -- Pas de présence
        S <= '1';  -- Éclairage forcé
        wait for 3 ms;

        P <= '0';  -- Pas de présence
        S <= '0';  -- Éclairage automatique
        wait for 4 ms;

        assert L = '0' report "Erreur : La sortie L n'est pas conforme à l'attente" severity ERROR;

        wait;
    end process;

end behavior;