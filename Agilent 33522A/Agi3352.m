    
    driver = instrument.driver.Ag3352x();

    % Edit resource and options as needed.  Resource is ignored if option Simulate=true
    resourceDesc = 'GPIB0::10::INSTR';
    % resourceDesc = 'TCPIP0::<host_name or IP addr>::INSTR';

    initOptions = 'QueryInstrStatus=true, Simulate=false, DriverSetup= Model=33522A, Trace=false';			
    idquery = true;
    reset   = true;

    driver.Initialize(resourceDesc, idquery, reset, initOptions);
    disp('Driver Initialized');
    
    [IChannelRepcap] = driver.DeviceSpecific.Channels3.Item3('Channel1');
    [IChannelRepcap2] = driver.DeviceSpecific.Channels3.Item3('Channel2');
    
          
    %%%--- PULSE ----%%%%
    
    disp('Pulse');
    driver.DeviceSpecific.Status.Clear();
    driver.DeviceSpecific.Utility.Reset();
    IChannelRepcap.OutputFunction.Function = 3;
    
    IChannelRepcap.OutputFunction.Pulse.Period = 1;
    IChannelRepcap.Output.Voltage.Amplitude =2.7;
    IChannelRepcap.OutputFunction.Pulse.DutyCycle = 40;      
    IChannelRepcap.OutputFunction.Pulse.Transition.LeadingEdgeTime = 8.4E-9;
    IChannelRepcap.OutputFunction.Pulse.Transition.TrailingEdgeTime = 8.4E-9;
%     IChannelRepcap.OutputFunction.Pulse.Width = 20E-6;
    IChannelRepcap.Output.Enabled = 1;
    
    %%%--- !PULSE ----%%%%
    
    
    %%%---ARB------%%%%
%     disp('Arb Waveform Binary');
% %     driver.DeviceSpecific.Status.Clear();
% %     driver.DeviceSpecific.Utility.Reset();
%     IChannelRepcap.OutputFunction.ArbitraryWaveform.Clear();
%     
%     Data1 = [0; 1; 1];
%     Data2(1:(1e6-3)) = 0;
%     Data2 = Data2';
%     Data = [Data1;Data2];
%     
%     IChannelRepcap.OutputFunction3.ArbitraryWaveform3.LoadArbWaveformBinary('TestArb', Data);
%     driver.DeviceSpecific.System.WaitForOperationComplete(2000);
%     IChannelRepcap.Output.Voltage.Amplitude = 2;
%     IChannelRepcap.Output.Voltage.Offset.DCOffset = 0;
%     IChannelRepcap.Output.Load = 50;
%     IChannelRepcap.OutputFunction.ArbitraryWaveform.SRate.SampleRate = 250000000;
%     IChannelRepcap.OutputFunction.Function = 6;
%     IChannelRepcap.OutputFunction.ArbitraryWaveform.SelectArbWaveform('TestArb');
%     IChannelRepcap.Output.Enabled = 1;
%     IChannelRepcap2.Output.Enabled = 1;
%     
    %%%---! ARB------%%%%
    
    
    
%     driver.Close();
%     disp('Driver Closed');
%     clear;
%     clc;
    