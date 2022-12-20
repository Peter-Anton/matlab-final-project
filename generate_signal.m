function des_signal = generate_signal(signal_num,time)
switch signal_num
   case 1
        
        amp = input('please enter the Amplitude :');
        
        freq = input('please enter the Frequency : ');
      
        phase = input('please enter the Phase :');
        
        des_signal = amp*sin(2*pi*time*freq + phase);
    
    case 2
        
        amp = input('please enter the Amplitude :');
       
        len = length(time);
        
        des_signal = amp*ones(1,len);
    case 3
        
        amp = input('please enter the Amplitude :');
       
        intercept = input('please enter the intercept :');
        
        des_signal = amp*time+intercept;
    
   
    case 4
        power = input('please provide the power');
        i=1;
        fprintf('');
        coeffenets = zeros(1, power+1);
        des_signal = 0;
        while (i<=power+1)
            coeffenets(i)=input('please enter the coeffenets of the signal from higher to lower order:');
            des_signal=portion_signal+coeffenets(i)*time.^((power+1)-i);
            i=i+1;
        end
        
    
    case 5
        
        amp = input('please enter the Amplitude :');
        
      
        e = input('please enter the exponent :');
        
        des_signal = amp*exp(e*time);
        
end
end