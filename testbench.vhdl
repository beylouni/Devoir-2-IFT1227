------------------------------------------------
--                                            --
--            DEVOIR 2 - IFT1227              --
-- Luciano Beylouni / Maxime Davidson-Longpré --
--                                            --
------------------------------------------------

-- Testbench pour le circuit LightingControl

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LightingControl_Testbench is
end LightingControl_Testbench;

architecture Behavioral of LightingControl_Testbench is
    signal P, S, L: STD_LOGIC;
    signal Clock: STD_LOGIC := '0';
    constant Clock_Period: time := 10 ns;  -- Période de l'horloge (à ajuster)

    component LightingControl is
        Port ( P : in STD_LOGIC;
            S : in STD_LOGIC;
            L : out STD_LOGIC
            );
    end component;

begin
    DUT: LightingControl port map (P, S, L);

    -- Processus de génération d'horloge
    Clock_Process: process
    begin
        while now < 500 ns loop  -- Simulation pendant 500 ns (à ajuster)
            Clock <= not Clock;
            wait for Clock_Period / 2;
        end loop;
        wait;
    end process;

    -- Processus de test
    Test_Process: process
    begin
        P <= '0';
        S <= '0';
        wait for 20 ns;  -- Attendre 2 cycles d'horloge

        P <= '1';
        S <= '0';
        wait for 20 ns;

        P <= '1';
        S <= '1';
        wait for 20 ns;

        P <= '0';
        S <= '1';
        wait for 20 ns;

        P <= '0';
        S <= '0';
        wait for 20 ns;

        P <= '1';
        S <= '1';
        wait for 20 ns;

        P <= '0';
        S <= '1';
        wait for 20 ns;

        P <= '1';
        S <= '1';
        wait for 20 ns;

        P <= '0';
        S <= '1';
        wait for 20 ns;

        P <= '0';
        S <= '0';
        wait for 20 ns;

        P <= '1';
        S <= '0';
        wait for 20 ns;

        P <= '1';
        S <= '1';
        wait for 20 ns;

        P <= '0';
        S <= '1';
        wait for 20 ns;

        P <= '0';
        S <= '0';
        wait for 20 ns;

        P <= '1';
        S <= '0';
        wait for 20 ns;

        P <= '0';
        S <= '0';
        wait for 20 ns;

        wait;
    end process;

end Behavioral;
