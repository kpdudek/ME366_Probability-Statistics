function die_roll
n = 10000;
rolls = randsrc(3,n,[1,2,3,4,5,6;(3/10),(1/10),(1/10),(1/10),(1/10),(3/10)]);
sums = sum(rolls);

probs = [];
for i = 3:18
    prob = length(sums(find(sums==i)))/n;
    legible = sprintf('The probability for %d is %.4f\n',i,prob);
    disp(legible)
    probs(end+1)=prob;
end
%bar(probs)
end



