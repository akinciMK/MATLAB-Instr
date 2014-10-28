
%Ba�lant� i�in handle olu�turuluyor <smlDev>

smlDev = visa('ni', 'GPIB0::5::INSTR');


%Ba�lant� a��l�yor

fopen(smlDev);



fprintf(smlDev, 'POW -15');

disp('> RF LEVEL -15 DBM Olarak Ayarland�');
pause(1);

fprintf(smlDev, 'SOUR:AM:DEPT 20');

disp('> AM Mod�lasyon Derinli�i %20 Olarak Ayarland�');
pause(1);

fprintf(smlDev, 'SOUR:AM:STAT ON');
disp('> AM Mod�lasyon Aktif');
pause(1);

disp('> RF ��k�� A��l�yor');
disp('> .');
disp('> .');
disp('> .');
pause(1)

fprintf(smlDev, 'OUTP1 ON');
pause(1);
disp('> RF ��k�� Aktif');
disp('> Sweep Ba�l�yor');

pause(1);


freq = 100;

for i=0:10
    command = sprintf('SOUR:FREQ %d MHZ',freq);
    
    fprintf(smlDev, command);
    
    displayMsg = sprintf('> �u andaki Frekans: %d MHZ',freq);
    disp(displayMsg);
    
    freq = freq + 100;
    
    pause(2);
    
    
end

disp('> Sweep Tamamland�');
pause(1);
disp('> AM Mod�lasyon Kapat�l�yor');
pause(1)
fprintf(smlDev, 'SOUR:AM:STAT OFF');
disp('> RF ��k�� Deaktif');
fprintf(smlDev, 'OUTP1 OFF');
disp('> Cihazla Ba�lant� Kesiliyor...');
pause(1)
%Cihaz kapat�l�yor
%Bu k�s�m �nemli ��nk� her i�lem sonunda cihazla ba�lant� kesilmeli.
%Aksi taktirde MATLAB arkaplanda cihazla ba�lant� a��k kalaca�� i�in
%hi� bir �ekilde cihazla ba�ka bir yoldan haberle�mek m�mk�n olmuyor.
%Ayn� zamanda MATLAB restart edilmek zorunda kalabilir.

fclose(smlDev);

disp('> Cihazla Ba�lant� Kesildi.');
