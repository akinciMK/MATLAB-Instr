
%Baðlantý için handle oluþturuluyor <smlDev>

smlDev = visa('ni', 'GPIB0::5::INSTR');


%Baðlantý açýlýyor

fopen(smlDev);



fprintf(smlDev, 'POW -15');

disp('> RF LEVEL -15 DBM Olarak Ayarlandý');
pause(1);

fprintf(smlDev, 'SOUR:AM:DEPT 20');

disp('> AM Modülasyon Derinliði %20 Olarak Ayarlandý');
pause(1);

fprintf(smlDev, 'SOUR:AM:STAT ON');
disp('> AM Modülasyon Aktif');
pause(1);

disp('> RF Çýkýþ Açýlýyor');
disp('> .');
disp('> .');
disp('> .');
pause(1)

fprintf(smlDev, 'OUTP1 ON');
pause(1);
disp('> RF Çýkýþ Aktif');
disp('> Sweep Baþlýyor');

pause(1);


freq = 100;

for i=0:10
    command = sprintf('SOUR:FREQ %d MHZ',freq);
    
    fprintf(smlDev, command);
    
    displayMsg = sprintf('> Þu andaki Frekans: %d MHZ',freq);
    disp(displayMsg);
    
    freq = freq + 100;
    
    pause(2);
    
    
end

disp('> Sweep Tamamlandý');
pause(1);
disp('> AM Modülasyon Kapatýlýyor');
pause(1)
fprintf(smlDev, 'SOUR:AM:STAT OFF');
disp('> RF Çýkýþ Deaktif');
fprintf(smlDev, 'OUTP1 OFF');
disp('> Cihazla Baðlantý Kesiliyor...');
pause(1)
%Cihaz kapatýlýyor
%Bu kýsým önemli çünkü her iþlem sonunda cihazla baðlantý kesilmeli.
%Aksi taktirde MATLAB arkaplanda cihazla baðlantý açýk kalacaðý için
%hiç bir þekilde cihazla baþka bir yoldan haberleþmek mümkün olmuyor.
%Ayný zamanda MATLAB restart edilmek zorunda kalabilir.

fclose(smlDev);

disp('> Cihazla Baðlantý Kesildi.');
