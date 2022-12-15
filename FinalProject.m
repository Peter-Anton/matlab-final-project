fs=input("please enter sampling frequancy:");
tstart=input("please enter starting time scaling:");
tend=input("please enter end time scaling:");
t=linspace(tstart,tend,(tend-tstart)*fs);
breakPoint=input("please enter break point:");
if(breakPoint>0)
    pos=zeros(1,breakPoint);
    fprintf('enter the positions:\n');
else
    pos=[0];
end
i=1;
while(i<=breakPoint)
    pos1=input('');
    if(pos1<tend&&pos1>tstart)
        pos(i)=pos1;
    else
        fprintf('enter a valid position');
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
while(j<=breakPoint+1)
    time=linspace(times(j),times(j+1),(times(j+1)-times(j))*fs);
    signal_name=input('enter name of the signal:','s');
    des_signal=generate_signal(signal_name,time);
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
                    signal_modified = amp*signal;
                    figure(2)
                    plot(t,signal_modified)
                    title('Amplified Signal')
        case 'b'
                   time = -1.*t;
                    figure(3)
                    plot(time,signal)
                    title('Time Reversed Signal')
         case 'c'
                    shift = input('enter the value of the shift:');
                    time= t+shift;
                    figure(4)
                    plot(time,signal)
                    title('Shifted Signal')
         case 'd'
                  
                    expan = input('enter the value of Expantion:');
                    time= expan*t;
                    figure(5)
                    plot(time,signal)
                    title('Expanded Signal')
          case 'e'
                
                    comp = input('enter the value of Compresstion:');
                    time = t./comp;
                    figure(6)
                    plot(time,signal)
                    title('Comoresed Signal')
           case 'f'
               return;
        
                    
    end
op=op-1;
end
elseif strcmp(ans1,'n')
    signal=signal;
    fprintf('thank you')
end