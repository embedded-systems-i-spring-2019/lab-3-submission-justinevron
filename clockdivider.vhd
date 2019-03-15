----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2019 08:45:13 PM
-- Design Name: 
-- Module Name: clockdivider - Behavioral
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

entity clockdivider is
    Port (clk_slow : out STD_LOGIC;
          clk : in STD_LOGIC);
end clockdivider;

architecture Behavioral of clockdivider is
signal counter : std_logic_vector(26 downto 0);
begin

process (clk)
begin
    if rising_edge(clk) then         
        if (unsigned(counter) < 124999999/115200) then
            counter <= std_logic_vector(unsigned(counter) + 1);
            clk_slow <= '0'; 
        else
             counter <= (others => '0');
             clk_slow<= '1';
        end if;
    end if;
end process;


end Behavioral;
