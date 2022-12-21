fs = input("Sampling frequency: ");

tstart=input("Start time scale: ");
tend=input("End time scale: ");
t=linspace(tstart,tend,(tend-tstart)*fs);
breakPoint=input("Number of break points: ");
if(breakPoint>0)
    pos = zeros(1, breakPoint);
else
    pos = [0];
end
i=1;
while(i<=breakPoint)
    pos1=input("Enter position " + i + ": ");
    if(pos1<tend&&pos1>tstart)
        pos(i)=pos1;
    else
        fprintf('Enter a valid position!\n');
        i=i-1;
    end
    i=i+1;
end

if(breakPoint>0)
    times=[tstart pos tend];
else
    times=[tstart tend];
end
signal=[];
j=1;
fprintf("Choose your desired signal:\n1-siusoidal\n2-dc \n3-ramp \n4-polynomial \n5-expontiel\n")
while(j<=breakPoint+1)
    time=linspace(times(j),times(j+1),(times(j+1)-times(j))*fs);
    signal_num=input('enter number of the signal:');
    des_signal = generate_signal(signal_num,time);
    signal=[signal,des_signal];
    j=j+1;
end
figure(1)
plot(t,signal)
title('Original Signal')

ans1=input('do yo want to make opertion (y/n):','s');
if strcmp(ans1,'y')
fprintf('The operations you can perform on the signal are:\na-Amplitude Scaling, \nb-Time reversal, \nc-Time shift, \nd-Expanding the signal, \ne-Compressing the signal, \nf-None\n\n');
op_num=input('enter number of opertion you want to perform(from 1 to 5):','s');
while(op_num>0)
    op= input('enter which opertion do you want(a or b or c or d or e or f)','s');
    switch op
        case 'a'
                    amp = input('Enter the valule of amplification:','s');
                    signal_modified = amp.*signal;
                    figure(2)
                    plot(t,signal_modified)
                    title('Amplified Signal')
                    op_num=op_num-1;
        case 'b'
                   time = -1.*t;
                    figure(3)
                    plot(time,signal)
                    title('Time Reversed Signal')
                    op_num=op_num-1;
         case 'c'
                    shift = input('enter the value of the shift:');
                    time= t+shift;
                    figure(4)
                    plot(time,signal)
                    title('Shifted Signal')
                    op_num=op_num-1;
         case 'd'
                  
                    expan = input('enter the value of Expantion:');
                    time= expan*t;
                    figure(5)
                    plot(time,signal)
                    title('Expanded Signal')
                    op_num=op_num-1;
          case 'e'
                
                    comp = input('enter the value of Compresstion:');
                    time = t./comp;
                    figure(6)
                    plot(time,signal)
                    title('Comoresed Signal')
                    op_num=op_num-1;
           case 'f'
               op_num=op_num-1;
               return;
        
                    
    end
op_num=op_num-1;
end
end