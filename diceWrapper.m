%diceWrapper
clear all
clc

%%%%%%%%%%%%%%%%%%%%%%%
toggleRapidShot = 0;
toggleDeadlyAim = 1;
toggleGravityBow = 0;
toggleFavoredEnemy = 0;
toggleWithin30Ft = 1;
toggleHasted = 0;
%%%%%%%%%%%%%%%%%%%%%%%


attackMods = [23	18	13];
damageMod = 7;
if toggleGravityBow == 1
damageRollSides = 6;
damageRollNumber= 2;
disp('gravity bow is on.')
else
damageRollSides = 8;
damageRollNumber= 1;
end
if toggleFavoredEnemy
attackMods = attackMods+4;
damageMod = damageMod+4;
disp('Shooting at a favored enemy.')
end
if toggleWithin30Ft
 attackMods = attackMods+1;
 damageMod = damageMod+1;
 disp('Shooting within 30 ft.')
end
if toggleRapidShot
 disp('Using RapidShot.')
 attackMods = attackMods-2;
 attackMods = [attackMods(1),attackMods];
end
if toggleDeadlyAim
 disp('Using DeadlyAim.')
 attackMods = attackMods-4;
 damageMod = damageMod+8;
end
if toggleHasted
 disp('Using Haste.')
 attackMods = attackMods+1;
 attackMods = [attackMods(1),attackMods];
end

for i = 1:length(attackMods)
[valAttack,stroutAttack] = rollDice(20,1);
disp(['attack Roll ', num2str(i),':'])
fprintf([stroutAttack(1:end),num2str(attackMods(i)), '\n']);
fprintf([num2str(valAttack + attackMods(i)), '\n']);
disp(['Damage Roll ', num2str(i),':'])

if i == 1 %we do double damage on attack 1
 [valDamage1,stroutDamage1] = rollDice(damageRollSides,2*damageRollNumber); %bow damage
 [valDamage2,stroutDamage2] = rollDice(6,2); %fire Damage
 thisDamageMod = 2*damageMod;
else
 [valDamage1,stroutDamage1] = rollDice(damageRollSides,damageRollNumber); %bow damage
 [valDamage2,stroutDamage2] = rollDice(6,2); %fire Damage
 thisDamageMod = damageMod;
end
fprintf([stroutDamage1(1:end),stroutDamage2(1:end),num2str(thisDamageMod), '\n']);
fprintf([num2str(valDamage1 + valDamage2 + thisDamageMod), '\n']);
end