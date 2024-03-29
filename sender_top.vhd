----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2019 11:58:01 AM
-- Design Name: 
-- Module Name: sender_top - Structural
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

entity sender_top is
    Port ( TXD : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (1 downto 0);
           clk : in STD_LOGIC;
           RXD : out STD_LOGIC;
           CTS : out STD_LOGIC;
           RTS : out STD_LOGIC);
end sender_top;

architecture Structural of sender_top is
    component uart
        port (
clk, en, send, rx, rst      : in std_logic;
              charSend                    : in std_logic_vector (7 downto 0);
              ready, tx, newChar          : out std_logic;
              charRec                     : out std_logic_vector (7 downto 0));
    end component;
    component debounce
        Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC;
           debounced : out STD_LOGIC);
    end component;
    component clockdivider
        Port (clk_slow : out STD_LOGIC;
              clk : in STD_LOGIC);
    end component;
    component sender
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           en : in STD_LOGIC;
           btn : in STD_LOGIC;
           ready : in STD_LOGIC;
           send : out STD_LOGIC;
           char : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    signal rstbtn, btn1: std_logic;
    signal div, snd, ready : STD_LOGIC;
    signal char: std_logic_vector(7 downto 0);
    
begin
rts <= '0';
cts <= '0';
clkdiv: clockdivider
    port map(clk=> clk,
             clk_slow =>div);
rstdbnc: debounce
    port map(clk => clk,
             btn => btn(0),
             debounced => rstbtn);
btndbnc:debounce
    port map(clk => clk,
             btn => btn(1),
             debounced => btn1);
snder: sender
    port map(clk => clk,
             btn => btn1,
             en => div,
             ready => ready,
             rst => rstbtn,
             send => snd,
             char => char);
u5: uart
    port map(clk => clk,
             en => div,
             send => snd,
             rx => TXD,
             rst => rstbtn,
             charSend => char,
             ready => ready, 
             tx => RXD);
end Structural;
