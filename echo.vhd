----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2019 12:55:45 PM
-- Design Name: 
-- Module Name: echo - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity echo is
    Port ( clk : in STD_LOGIC;
           ready : in STD_LOGIC;
           charin : in STD_LOGIC_VECTOR (7 downto 0);
           newchar : in STD_LOGIC;
           charout : out STD_LOGIC_VECTOR (7 downto 0);
           send : out STD_LOGIC);
end echo;

architecture Behavioral of echo is

begin


end Behavioral;
