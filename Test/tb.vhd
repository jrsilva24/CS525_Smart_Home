library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity tb is 
end;

architecture bench of tb is
   component Add2
     port(
	
	 clock, enable: in std_logic;
	 l1,l2,l3,l4,volUp,volDown: in std_logic;
	 l5: in std_logic_vector (6 downto 0);
	 fdoor,rdoor,win,alarm,heater,cooler,emergencyCall: out std_logic;
	 disp: out std_logic_vector (2 downto 0); 
	 volume: out std_logic_vector (0 downto 4)
    );
    end component Add2;

   signal clock_Signal : std_logic;
   signal enable_Signal : std_logic;

   signal l1_Signal : std_logic;
   signal l2_Signal : std_logic;
   signal l3_Signal : std_logic;
   signal l4_Signal : std_logic;
   signal volUp_Signal : std_logic;
   signal volDown_Signal : std_logic;
   signal l5_Signal : std_logic_vector (6 downto 0);
   signal fdoorS,rdoorS,winS,alarmS,heaterS,coolerS,emergencyCallS : std_logic;
   signal dispS: std_logic_vector (2 downto 0);
   signal volumeS : std_logic_vector (0 downto 4);

   constant clock_period: time := 50ns;
   signal stop_the_clock : boolean;
   
begin

   uut : Add2 port map ( l1 => l1_Signal, l2 => l2_Signal, l3 => l3_Signal, l4 => l4_Signal,
			volUp => volUp_Signal, volDown => volUp_Signal, l5 => l5_Signal, 
			clock => clock_Signal, enable => enable_Signal);


 stimulus : process
 begin

   wait for 50 ns;
   l1_Signal <= '0';
   wait for 50 ns;
   l1_Signal <= '1';

   wait for 100 ns;
   l2_Signal <= '1';
   wait for 100 ns;
   l2_Signal <= '0';

   wait for 100 ns;
   l3_Signal <= '1';
   wait for 100 ns;
   l3_Signal <= '0';


   wait for 100 ns;
   l3_Signal <= '1';
   l1_Signal <= '1';
   wait for 200 ns;
   l3_Signal <= '0'; 
   l1_Signal <= '0';

 end process;
end bench;

