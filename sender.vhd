----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2019 11:30:40 AM
-- Design Name: 
-- Module Name: sender - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sender is
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           en : in STD_LOGIC;
           btn : in STD_LOGIC;
           ready : in STD_LOGIC;
           send : out STD_LOGIC;
           char : out STD_LOGIC_VECTOR (7 downto 0));
end sender;

architecture Behavioral of sender is
type word is array (0 to 4) of STD_LOGIC_VECTOR(7 downto 0);
type state is (idle, busyA, busyB, busyC);
signal curr : state := idle;
signal NETID : word := (x"6A", x"64", x"65", x"34", x"38");
signal i : STD_LOGIC_VECTOR(2 downto 0) := "000";

begin
    FSM:process(clk)
    begin
        if rising_edge(clk) and en = '1' then
            if rst = '1' then
                send <= '0';
                char <= x"00";
                i <= "000";
                curr <= idle;
            end if;
            case curr is
                when idle =>
                    if ready = '1' and btn = '1' then
                        if unsigned(i) < 5 then
                            send <= '1';
                            char <= netid(natural(to_integer(unsigned(i))));                       
                            i <= STD_logic_VECTOR(unsigned(i) + 1);
                            curr <= busyA;
                        else
                            i <= "000";
                        end if;
                    end if;
                when busyA =>
                    curr <= busyB;
                when busyB =>
                    send <= '0';
                    curr <= busyC; 
                when busyC =>
                    if ready = '1' and btn = '0' then
                        curr <= idle;
                    end if;                
            end case;
        end if;
    end process;

end Behavioral;
