
smlDev = visa('ni', 'GPIB0::5::INSTR');


%Ba�lant� a��l�yor

fopen(smlDev);

%IDN bilgisi query ediliyor
kimlik = query(smlDev, '*IDN?');

fclose(smlDev);