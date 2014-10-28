
smlDev = visa('ni', 'GPIB0::5::INSTR');


%Baðlantý açýlýyor

fopen(smlDev);

%IDN bilgisi query ediliyor
kimlik = query(smlDev, '*IDN?');

fclose(smlDev);