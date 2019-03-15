----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2019 09:51:32 AM
-- Design Name: 
-- Module Name: debounce - Behavioral
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

entity debounce is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC;
           debounced : out STD_LOGIC);
end debounce;

architecture Behavioral of debounce is
signal reg : STD_LOGIC_VECTOR(1 downto 0);
signal count : STD_LOGIC_VECTOR(21 downto 0); 

begin
    process(clk)
    begin
        if rising_edge(clk) then
            reg(1) <= reg(0);
            reg(0) <= btn;
            if reg(1) = '1'  then
                if unsigned(count) < 2500000 then
                    count <= STD_LOGIC_VECTOR(unsigned(count) + 1);
                else
                    debounced <= '1';
                end if;
            elsif reg(1) = '0' then
                count <= (others => '0');
                debounced <= '0';
            end if;
        end if;
    end process;

end Behavioral;
