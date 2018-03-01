%{
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Jacob McCloughan | K1734094
% This function generates the coordinates
% for a simple circle, enclosed by n points.
% Its origin is at cx, cy and its radius is
% measured as r.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%}
function [x, y] = circle(cx, cy, r, n)
% Range of t values.
t = linspace(0, -2*pi, n + 1);

% Our x values.
x = r*cos(t)+cx;

% Our y values.
y = r*sin(t)+cy;
end