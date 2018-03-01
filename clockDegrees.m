%{
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Jacob McCloughan | K1734094
% Function for calculating initial position
% of second and minute hands. Uses indexes
% of a circle with 361 points.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%}
function c = clockDegrees(s)
    % For when the hand is between 12 and 3
    if and(s >= 0,s <= 15)
        c = 91 - (s*6);
    end
    
    % For when the hand is not between 12 and 3
    if and(s > 15, s < 60)
        c = (361- ((s - 15) * 6));
    end
end