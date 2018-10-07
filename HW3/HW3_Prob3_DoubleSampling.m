function HW3_Prob3_DoubleSampling

prob = .01:.01:.15;
probs = zeros(1,15);
for i = 1:15
    probs(i) = binocdf(1,20,prob(i)) + (binopdf(2,20,prob(i))*binopdf(0,15,prob(i)));
    disp(probs(i))
end

figure('Visible','on','Name','HW3 Prob3')
plot(prob,probs,'o-','LineWidth',2)
title('Double Acceptance Sampling')
xlabel('p')
ylabel('P(accepted)')