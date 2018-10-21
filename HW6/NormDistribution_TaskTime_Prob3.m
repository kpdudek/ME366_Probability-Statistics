function NormDistribution_TaskTime_Prob3
% Assume a product development project consists of performing three tasks
% denoted by T1, T2 and T3. T1 and T2 are performed by two different teams and they
% begin at the same time. T3 cannot begin before T1 and T2 are both completed. The
% project leader is interested in coming up with an estimate of the length of the overall
% project, denoted by T.
% It is estimated that T1 can be modeled by a normal random variable with mean 10
% months and standard deviation 2 months, T2 by a normal random variable with mean
% 8 months and standard deviation 4 months, and T3 by a normal random variable with
% mean 5 months and standard deviation 3 months.
% Using Excel, generate 10,000 samples of T1, T2 and T3 and use those to find 10,000
% samples of T.

% (a) Find and plot the histogram of T.
% (b) Estimate the mean, the standard deviation, the largest value, and the smallest
%     value of T using the 10000 samples.
% (c) Find the 95 percentile and the typical range of T. (Assume the typical range is
%     defined as the range between the 2.5 and 97.5 percentiles.)

% r = normrnd(mean,std)
% t1 = normrnd(10,2); %time to complete Task 1 (months)
% t2 = normrnd(8,4); %time to complete Task 1 (months)
% t3 = normrnd(5,3); %time to complete Task 1 (months)
% 
% T = max([t1,t2]) + t3;
global x
x = 1;

simulate_project();
average_stats();


function [meanv,stdv,minv,maxv,pt,p95] = simulate_project()
global x
T = [];
for i = 1:10000
    t1 = normrnd(10,2); %time to complete Task 1 (months)
    t2 = normrnd(8,4); %time to complete Task 1 (months)
    t3 = normrnd(5,3); %time to complete Task 1 (months)
    
    T(end+1) = max([t1,t2]) + t3;
end

if x == 1
    figure
    histogram(T)
    xlabel('Time to complete project (Months)')
    ylabel('Occurences in 10000 simulations')
    title('Histogram of Project Time')
    x = x+1;
end

minv = min(T);
maxv = max(T);
meanv = mean(T);
stdv = std(T);
p1 = prctile(T,97.5);
p2 = prctile(T,2.5);
pt = p1-p2; % Typical range
p95 = prctile(T,95); % 95th percentile

function [meanv,stdv,minv,maxv,pt,p95] = average_stats()
global x
std_ = [];
mean_ = [];
min_ = [];
max_ = [];
pt_ = [];
p95_ = [];

for i = 1:5
    [mean_(end+1),std_(end+1),min_(end+1),max_(end+1),pt_(end+1),p95_(end+1)] = simulate_project();
end

meanv = mean(mean_);
stdv = mean(std_);
minv = mean(min_);
maxv = mean(max_);
pt = mean(pt_);
p95 = mean(p95_);

fprintf('Average mean = %.2f\nAverage std = %.2f\nAverage min = %.2f\nAverage max = %.2f\nAverage typical = %.2f\nAverage 95 = %.2f\n',meanv,stdv,minv,maxv,pt,p95)

