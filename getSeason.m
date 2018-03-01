%{
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Jacob McCloughan | K1734094
% Function for determining which season
% it is based on a given day, month
% and year. Uses northern meteorogical 
% seasons for basis.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%}
function s = getSeason(month)
    % If the month is between March and June 1st
    if (month >= 3 && month < 6)
        s = 'Spring'; % Return season as spring
    % If month is between June and September 1st
    elseif (month >= 6 && month < 9)
        s = 'Summer'; % Return season as summer
    % If month is between September and December 1st
    elseif (month >= 9 && month < 12)
        s = 'Autumn'; % Return season as autumn
    % If month is anything else
    else
        s = 'Winter'; % Return season as winter
    end
end