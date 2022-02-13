clc;
clear all;
close all;


[file,path]=uigetfile('*.*');
fileName = fullfile(path,file);
[Ywav Fwav] = audioread(fileName);
% sound(Y,Fs);
gain_1=input('please enter the gain "1" of frequency band [0-170Hz] in dB : ');
gain_2=input('please enter the gain "2" of frequency band [170-310Hz]in dB : ');
gain_3=input('please enter the gain "3" of frequency band [310-600Hz]in dB : ');
gain_4=input('please enter the gain "4" of frequency band [600-1000Hz]in dB : ');
gain_5=input('please enter the gain "5" of frequency band [1-3KHz]in dB : ');
gain_6=input('please enter the gain "6" of frequency band [3-6KHz]in dB : ');
gain_7=input('please enter the gain "7" of frequency band [6-12KHz]in dB : ');
gain_8=input('please enter the gain "8" of frequency band [12-14KHz]in dB : ');
gain_9=input('please enter the gain "9" of frequency band [14-16KHz]in dB : ');
SampleRate=input('please enter Output sample rate : ');
choiceType=menu('Choose the type of filter required:','FIR','IIR');
 
 FsAssumed=40000;%assumption
 dt=1/Fwav;
% %  t=0:dt:(length(Ywav)*dt)-dt;
t=linspace(0,length(Ywav)./Fwav,length(Ywav));
 figure;plot(t,Ywav);title('Signal in time domain');
% figure;stem(abs(fftshift(fft(y))));title('Signal in freq domain');
% xlabel('Fvec')
% ylabel('Ymag')

    

wn1=170;
wn2=[170,310];
wn3=[310,600];
wn4=[600,1000];
wn5=[1000,3000];  
wn6=[3000,6000];
wn7=[6000,12000];
wn8=[12000,14000];
wn9=[14000,16000];
wn=[wn1 wn2 wn3 wn4 wn5 wn6 wn7 wn8 wn9];
den[]
w[]
H[]
if choiceType==1 %FIR
     N1=120;%assumption
    for i=[1 2 3 4 5 6 7 8 9] 
   
    num1=fir1(N1,wn(i)./(FsAssumed./2));%generate FIR low pass filter
    deni=[1]; %FIR has no denominator
    figure;freqz(numi);title('filter(0-170hz) in frequency domain'); %plotting magnitude and phase
    [Hi],w[i]]=freqz(numi); %get transfer fn
    figure;impz(Hi,1,[],FsAssumed); %plotting impulse response
    figure; stepz(Hi,1,[],FsAssumed);%plotting step response
    figure;zplane(roots(numi),roots(1)); %zero-pole
    Tfi=tf(numi,deni); 
    [zi, ki]=zero(Tfi) %gain
      
    
%     num2=fir1(N1,wn2./(FsAssumed./2));%generate FIR band pass filter
%     den2=[1];
%     figure;freqz(num2);title('filter(170-310hz) in frequency domain');
%     [H2,w2]=freqz(num2);
%     figure;impz(H2,1,[],FsAssumed);
%     figure; stepz(H2,1,[],FsAssumed);
%     figure;zplane(roots(num2),roots(1));
%     Tf2=tf(num2,den2);
%     [z2, k2]=zero(Tf2)
%     
%     
%     num3=fir1(N1,wn3./(FsAssumed./2));%generate FIR band pass filter
%     den3=[1];
%     figure;freqz(num3);title('filter(310-600hz) in frequency domain');
%     [H3,w3]=freqz(num3);
%     figure;impz(H3,1,[],FsAssumed);
%     figure; stepz(H3,1,[],FsAssumed);
%     figure;zplane(roots(num3),roots(1));
%     Tf3=tf(num3,den3);
%     [z3, k3]=zero(Tf3)
%           
%     
%     num4=fir1(N1,wn4./(FsAssumed./2));%generate FIR band pass filter
%     den4=[1];
%     figure;freqz(num4);title('filter(600-1000hz) in frequency domain');
%     [H4,w4]=freqz(num4);
%     figure;impz(H4,1,[],FsAssumed);
%     figure; stepz(H4,1,[],FsAssumed);
%     figure;zplane(roots(num4),roots(1));
%     Tf4=tf(num4,den4);
%     [z4, k4]=zero(Tf4)     
%     
%     
%     num5=fir1(N1,wn5./(FsAssumed./2));%generate FIR band pass filter
%     den5=[1];
%     figure;freqz(num5);title('filter(1000-3000hz) in frequency domain');
%     [H5,w5]=freqz(num5);
%     figure;impz(H5,1,[],FsAssumed);
%     figure; stepz(H5,1,[],FsAssumed);
%     figure;zplane(roots(num5),roots(1));
%     Tf5=tf(num5,den5);
%     [z5, k5]=zero(Tf5)
%     
%     num6=fir1(N1,wn6./(FsAssumed./2))%generate FIR band pass filter
%     den6=[1];
%     figure;freqz(num6);title('filter(3000-6000hz) in frequency domain');
%     [H6,w6]=freqz(num6);
%     figure;impz(H6,1,[],FsAssumed);
%     figure; stepz(H6,1,[],FsAssumed);
%     figure;zplane(roots(num6),roots(1));
%     Tf6=tf(num6,den6);
%     [z6, k6]=zero(Tf6)
%     
%     
%     num7=fir1(N1,wn7./(FsAssumed./2));%generate FIR band pass filter
%     den7=[1];
%     figure;freqz(num7);title('filter(6000-1200hz) in frequency domain');
%     [H7,w7]=freqz(num7);
%     figure;impz(H7,1,[],FsAssumed);
%     figure; stepz(H7,1,[],FsAssumed);
%     figure;zplane(roots(num7),roots(1));
%     Tf7=tf(num7,den7);
%     [z7, k7]=zero(Tf7)
%         
%     
%     num8=fir1(N1,wn8./(FsAssumed./2));%generate FIR band pass filter
%     den8=[1];
%     figure;freqz(num8);title('filter(1200-1400hz) in frequency domain');
%     [H8,w8]=freqz(num8);
%     figure;impz(H8,1,[],FsAssumed);
%     figure; stepz(H8,1,[],FsAssumed);
%     figure;zplane(roots(num8),roots(1));
%     Tf8=tf(num8,den8);
%     [z8, k8]=zero(Tf8)  
%     
%     num9=fir1(N1,wn9./(FsAssumed./2));%generate FIR band pass filter
%     den9=[1];
%     figure;freqz(num9);title('filter(1400-1600hz) in frequency domain');
%     [H9,w9]=freqz(num9);
%     figure;impz(H9,1,[],FsAssumed);
%     figure; stepz(H9,1,[],FsAssumed);
%     figure;zplane(roots(num9),roots(1));
%     Tf9=tf(num9,den9);
%     [z9, k9]=zero(Tf9)
%            
    end
end
    if choiceType==2 %IIR
    N2=2;%assumption
    [num1,den1]=butter(N2,wn1./(FsAssumed./2),'low'); %generate IIR low pass filter
    figure; impz(num1,den1); %plotting impulse response
    figure;stepz(num1,den1); %plotting step response
    [z1,p1,k1]=butter(N2,wn1./(FsAssumed./2),'low') %to get gain
    figure;zplane(z1,p1);%zero-pole
    figure;freqz(num1,den1);title('filter(0-170hz) in frequency domain');
    
    
    [num2,den2]=butter(N2,wn2./(FsAssumed./2));%generate IIR band pass filter
    figure;impz(num2,den2);
    figure;stepz(num2,den2);
    [z2,p2,k2]=butter(N2,wn2./(FsAssumed./2))
    figure;zplane(z2,p2);
     figure;freqz(num2,den2);title('filter(170-310hz) in frequency domain');
     
    [num3,den3]=butter(N2,wn3./(FsAssumed./2));%generate IIR band pass filter
    figure;impz(num3,den3);
    figure;stepz(num3,den3);
    [z3,p3,k3]=butter(N2,wn3./(FsAssumed./2))
     figure;zplane(z3,p3);
       figure;freqz(num3,den3); title('filter(310-600hz) in frequency domain');
     
    [num4,den4]=butter(N2,wn4./(FsAssumed./2));%generate IIR band pass filter
    figure;impz(num4,den4);
    figure;stepz(num4,den4);
    [z4,p4,k4]=butter(N2,wn4./(FsAssumed./2))
    figure;zplane(z4,p4);
    figure;freqz(num4,den4);title('filter(600-1000hz) in frequency domain');
    
    [num5,den5]=butter(N2,wn5./(FsAssumed./2));%generate IIR band pass filter
    figure;impz(num5,den5);
    figure;stepz(num5,den5);
    [z5,p5,k5]=butter(N2,wn5./(FsAssumed./2))
    figure;zplane(z5,p5);
    figure;freqz(num5,den5);title('filter(1000-3000hz) in frequency domain');
    
    [num6,den6]=butter(N2,wn6./(FsAssumed./2));%generate IIR band pass filter
    figure;impz(num6,den6);
    figure;stepz(num6,den6);
    [z6,p6,k6]=butter(N2,wn6./(FsAssumed./2))
    figure;zplane(z6,p6);
    figure;freqz(num6,den6);title('filter(3000-6000hz) in frequency domain');
    
    
    [num7,den7]=butter(N2,wn7./(FsAssumed./2));%generate IIR band pass filter
    figure;impz(num7,den7);
    figure;stepz(num7,den7);
    [z7,p7,k7]=butter(N2,wn7./(FsAssumed./2))
    figure;zplane(z7,p7);
    figure;freqz(num7,den7);title('filter(6000-1200hz) in frequency domain');
    
    [num8,den8]=butter(N2,wn8./(FsAssumed./2));%generate IIR band pass filter
    figure;impz(num8,den8);
    figure;stepz(num8,den8);
    [z8,p8,k8]=butter(N2,wn8./(FsAssumed./2))
    figure;zplane(z8,p8);
    figure;freqz(num8,den8);title('filter(1200-1400hz) in frequency domain');
   
    
    [num9,den9]=butter(N2,wn9./(FsAssumed./2));%generate IIR band pass filter
    figure; impz(num9,den9)
    figure;stepz(num9,den9);
    [z9,p9,k9]=butter(N2,wn9./(FsAssumed./2))
    figure;zplane(z9,p9);
    figure;freqz(num9,den9);title('filter(1400-1600hz) in frequency domain');
    end
    Y=resample(Ywav,FsAssumed,Fwav);
    
  %Filter the wave file using the filters developed 
filtered1= filter(num1,den1,Y);  
fvtool(num1,den1,'Fs',FsAssumed); %tool that plots the magnitude & phase responses
filtered2= filter(num2,den2,Y);
fvtool(num2,den2,'Fs',FsAssumed);
filtered3= filter(num3,den3,Y);
fvtool(num3,den3,'Fs',FsAssumed);
filtered4= filter(num4,den4,Y);
fvtool(num4,den4,'Fs',FsAssumed);
filtered5= filter(num5,den5,Y);
fvtool(num5,den5,'Fs',FsAssumed);
filtered6= filter(num6,den6,Y);
fvtool(num6,den6,'Fs',FsAssumed);
filtered7= filter(num7,den7,Y);
fvtool(num7,den7,'Fs',FsAssumed);
filtered8= filter(num8,den8,Y);
fvtool(num8,den8,'Fs',FsAssumed);
filtered9= filter(num9,den9,Y);
fvtool(num9,den9,'Fs',FsAssumed);
figure; %plot output signals in time domain
subplot(3,3,1);plot(filtered1);
subplot(3,3,2);plot(filtered2);
subplot(3,3,3);plot(filtered3);
subplot(3,3,4);plot(filtered4);
subplot(3,3,5);plot(filtered5);
subplot(3,3,6);plot(filtered6);
subplot(3,3,7);plot(filtered7);
subplot(3,3,8);plot(filtered8);
subplot(3,3,9);plot(filtered9);


%amplify signals by gain taken from user
y1=filtered1.*gain_1;
y2=filtered2.*gain_2;
y3=filtered3.*gain_3;
y4=filtered4.*gain_4;
y5=filtered5.*gain_5;
y6=filtered6.*gain_6;
y7=filtered7.*gain_7;
y8=filtered8.*gain_8;
y9=filtered9.*gain_9;
Ytotal= y1+y2+y3+y4+y5+y6+y7+y8+y9; %Add the amplified - output signals in time domain to form composite signal.
Fs=SampleRate.*Fwav;
Ytotal=resample(Ytotal,Fs,FsAssumed);

filtered1=fftshift(abs(fft(filtered1)));
filtered2=fftshift(abs(fft(filtered2)));
filtered3=fftshift(abs(fft(filtered3)));
filtered4=fftshift(abs(fft(filtered4)));
filtered5=fftshift(abs(fft(filtered5)));
filtered6=fftshift(abs(fft(filtered6)));
filtered7=fftshift(abs(fft(filtered7)));
filtered8=fftshift(abs(fft(filtered8)));
filtered9=fftshift(abs(fft(filtered9)));
figure;%plot output signals in frequency domain
subplot(3,3,1);plot(filtered1);
subplot(3,3,2);plot(filtered2);
subplot(3,3,3);plot(filtered3);
subplot(3,3,4);plot(filtered4);
subplot(3,3,5);plot(filtered5);
subplot(3,3,6);plot(filtered6);
subplot(3,3,7);plot(filtered7);
subplot(3,3,8);plot(filtered8);
subplot(3,3,9);plot(filtered9);


figure;
dttotal=1/Fs;
ttotal=linspace(0,length(Ytotal)./Fs,length(Ytotal));
subplot(2,1,1);plot(ttotal,Ytotal);
title('Composite Signal in time domain')
Fvecorigin=linspace(-Fwav/2,Fwav/2,length(Y));
Fvectotal=linspace(-Fs/2,Fs/2,length(Ytotal));
subplot(2,1,2);plot(Fvectotal,abs(fftshift(fft(Ytotal))));
title('Composite Signal in freq domain')

figure;
subplot(2,1,1);plot(t,Ywav);
title('Original signal in time domain')

subplot(2,1,2);plot(ttotal,Ytotal);
title('Composite Signal in time domain')
figure;
subplot(2,1,1);plot(Fvecorigin,abs(fftshift(fft(Y))));
title('Original signal in frequeny docmain')
subplot(2,1,2);plot(Fvectotal,abs(fftshift(fft(Ytotal))));
title('Composite Signal in frequency domain')

sound(Ytotal/max(Ytotal),Fs)
audiowrite('output.wav',Ytotal,Fs);


