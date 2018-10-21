function NormDistribution_QualityControl_Problem1
% In a manufacturing process a critical dimension (say length) of each
% manufactured part is measured and compared with the specification range provided by
% the design engineers.
% Due to normal manufacturing variability the parts are not all of the same size. A
% random variable X is used to model the variable lengths. Assume X is a normal
% (Gaussian) random variable with mean 9.51 and standard deviation 0.045. The engineering
% specification range is given by 9.5 ± 0.1.

% (a) Find the fraction of parts that do not meet the specification.
% (b) Assume 1000 parts are produced a day. Specify the random variable of the number
%     of parts per day that do not meet the specification and find its mean.
% (c) Find the typical range of the number of parts per day that do not meetthe the
%     specification. (Assume the typical range is defined as the range between the 2.5
%     and 97.5 percentiles.)



% a)
p_bad = 1-(normcdf(9.6,9.51,.045)-normcdf(9.4,9.51,.045));
fprintf('The fraction of bad parts is: %.4f\n',p_bad)
