function null = fun(numHarmonics)
% numHarmonics =2;
f = (1:numHarmonics).*2-1;
fs = max(f)*1e2;
dt = 1/fs;
T = 1/min(f);
c = 1;
t = 0:dt:c*T;
for i = 1:length(f)
    A(i) = 1/f(i);
    harmonics(i,:) = A(i)*exp(-1i*2*pi*f(i).*t);
end  
% figure();
% plot(harmonics(1,:));
for i = 1:size(harmonics,2)
    s(i) = sum(harmonics(:,i));
end
% figure();
% hold on
% plot(t,real(s));
% plot(t,imag(s));
% plot(t,abs(s))
% legend("real","imag","abs(sum)")
% figure();
% plot(s)

for i = 1:length(t)
    center = zeros(length(f),1);
    for k = 2:length(f)
        center(k) = center(k-1)+harmonics(k-1,i);        
    end
    sig = center(k)+harmonics(k,i);
    center(k+1,1) = sig;
    plot(sig,'r*')
    hold on
    plot(s)
    for k = 2:length(center)
        plot([center(k-1) center(k)])
    end
    for k = 1:length(f)
        plot(center(k)+harmonics(k,:))
    end
    plot([0,5],[5,0],'.')
    plot([0,-5],[-5,0],'.')
    pause(dt/1e2)
    hold off
end

end