%dice_roller
function [val,strout] = rollDice(faces,number)
allRolls = randi([1,faces],1,number);
allFaces(:,1:number) = faces;
allValues = [allFaces;allRolls];
strout = sprintf('(1d%d)%d +',allValues(:));
val = sum(allRolls);
end