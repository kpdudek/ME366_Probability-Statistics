function Problem1_BinomRandomVars
[vals,probs] = binom_prob_mass(0,7,7,.7,'a');
prob_mass_graph(vals,probs,1,'b')
prob_cumulitive_graph(vals,probs,1,'b')

[vals,probs] = binom_prob_mass(0,7,7,.2,'c');
prob_mass_graph(vals,probs,1,'d')
prob_cumulitive_graph(vals,probs,1,'d')



function [vals,out] = binom_prob_mass(s,X,n,P,let)
head = sprintf('Probabilites, Part %s',let);
fprintf('\n %s\n',head)
vals = [];
out = [];
for i = s:X
    vals = [vals,i];
    val = binopdf(i,n,P);
    out = [out,val];
    print = sprintf('For X = %d, P = %e',i,val);
    fprintf('%s\n',print)
end

function prob_mass_graph(vals,probs,num,let)
head = sprintf('Mass function, Part %s',let);
figure('Visible','on','Name',head)
bar(vals,probs)
xlabel('Vlaues of X')
ylabel('Probability')
title(head)

function prob_cumulitive_graph(vals,probs,num,let)
head = sprintf('Cumulative Distribution, Part %s',let);
figure('Visible','on','Name',head)
cum_dist = zeros(1,length(vals));
cum_dist(1) = probs(1);
for i = 2:length(probs)
    dist = cum_dist(i-1) + probs(i);
    cum_dist(i) = dist;    
end
% vals = [vals(1),vals];
% cum_dist = [cum_dist(1),cum_dist];
vals = [vals,(vals(2:end)-1)];
cum_dist = [cum_dist,cum_dist(2:end)];
plot(sort(vals),sort(cum_dist),'.-','LineWidth',2,'MarkerSize',20)
xlabel('Values of X')
ylabel('Probability')
title(head)





