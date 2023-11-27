-- Codigo leer 4 monedas
library ieee;
use ieee.std_logic_1164.all;

entity LEER_MONEDA is
    Port (  
        clk : in std_logic;

        UP_IN: in std_logic;
    	DOP_IN: in std_logic;
        CP_IN: in std_logic;
        DP_IN: in std_logic;
        RST_IN : in std_logic;

        UP_OUT: out std_logic;
    	DOP_OUT: out std_logic;
        CP_OUT: out std_logic;
        DP_OUT: out std_logic;
        RST_OUT : out std_logic;

        --BTN_IN_VECTOR: out std_logic_vector(1 downto 0) := (others => '0');
        MONEDA_IN: inout integer range 0 to 99 := 0

    );
  end LEER_MONEDA;


architecture RTL of LEER_MONEDA is
component btn_antirreb is
    port (
        clk	: in std_logic;
		btn_in	: in std_logic;
		btn_out	: out std_logic
	);
end component;

begin
    DUT1: btn_antirreb port map(clk=>clk, btn_in=>UP_IN, btn_out=>UP_OUT); --DUT Device Under Test
    DUT2: btn_antirreb port map(clk=>clk, btn_in=>DOP_IN, btn_out=>DOP_OUT); 
    DUT3: btn_antirreb port map(clk=>clk, btn_in=>CP_IN, btn_out=>CP_OUT); 
    DUT4: btn_antirreb port map(clk=>clk, btn_in=>DP_IN, btn_out=>DP_OUT); 
    DUT5: btn_antirreb port map(clk=>clk, btn_in=>RST_IN, btn_out=>RST_OUT); 

end RTL;