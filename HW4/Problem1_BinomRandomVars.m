function Problem1_BinomRandomVars
%%% PROBLEM 1 %%%
[vals,probs] = binom_prob_mass(0,7,7,.7,1,'a');
prob_mass_graph(vals,probs,1,'b')
prob_cumulitive_graph(vals,probs,1,'b')

[vals,probs] = binom_prob_mass(0,7,7,.2,1,'c');
prob_mass_graph(vals,probs,1,'d')
prob_cumulitive_graph(vals,probs,1,'d')

%%% PROBLEM 2 %%%
[vals2,probs2] = dice_probability_mass(6,2,'a');
prob_mass_graph(vals2,probs2,2,'b')
prob_cumulitive_graph(vals2,probs2,2,'b')

[vals3,probs3] = dice_cumulative(2,'c');
prob_mass_graph(vals3,probs3,2,'d')
prob_cumulitive_graph(vals3,probs3,2,'d')


% Compute the probability for each value of X
function [vals,out] = binom_prob_mass(s,X,n,P,num,let)
head = sprintf('Probabilites, Prob: %d, Part: %s',num,let);
fprintf('\n%s\n',head)
vals = [];
out = [];
for i = s:X
    vals = [vals,i];
    val = binopdf(i,n,P);
    out = [out,val];
    print = sprintf('For X = %d, P = %e',i,val);
    fprintf('%s\n',print)
end

% Compute the probability for each value the dice can have
function [vals,out] = dice_probability_mass(n,num,let)
head = sprintf('Probabilites, Prob: %d, Part: %s',num,let);

vals = 1:n;
out = zeros(1,n)+.16667;

fprintf('\n%s\n',head)
disp(vals)
disp(out)

% Compute the probability for each value that Z can have
function [vals,out] = dice_cumulative(num,let)
head = sprintf('Probabilites, Prob: %d, Part: %s',num,let);

vals = 3:18;
out = zeros(1,length(vals));

quant = [1,1,2,3,4,5,6,6,6,6,5,4,3,2,1,1];
p = (1/6)^3;
for i = 1:length(vals)
    for j = 1:quant(i)
        out(i) = out(i)+p;
    end
end

fprintf('\n%s\n',head)
disp(vals)
disp(out)


% Plot the probability mass function for the values and probabilites passed
% in
function prob_mass_graph(vals,probs,num,let)
head = sprintf('Mass function, Prob: %d, Part: %s',num,let);
figure('Visible','on','Name',head)
bar(vals,probs)
xlabel('Values of X')
ylabel('Probability')
title(head)

% Plot the cumulative distribution graph for the values and probabilities
% passed in
function prob_cumulitive_graph(vals,probs,num,let)
head = sprintf('Cumulative Distribution, Prob: %d, Part: %s',num,let);
figure('Visible','on','Name',head)

cum_dist = zeros(1,length(vals));
cum_dist(1) = probs(1);
for i = 2:length(probs)
    dist = cum_dist(i-1) + probs(i);
    cum_dist(i) = dist;    
end
% The next two lines form the rectangular shape of the cumulative
% distribution plot by shifting the probabilities one index to the left.
% The vectors are isolated from indexes 2 --> end and 1 is subtracted from
% the values to shift the values
vals = [vals,(vals(1:end-1)+1)];
cum_dist = [cum_dist,cum_dist(1:end-1)];

% The values must be sorted so that the sequential line connecting does not
% self intersect
plot(sort(vals),sort(cum_dist),'.-','LineWidth',2,'MarkerSize',20)
xlabel('Values of X')
ylabel('Probability')
title(head)





