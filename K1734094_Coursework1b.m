%{
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Jacob McCloughan | K1734094
% CI6260
% Computer Graphics Coursework (1B)
% November 24th, 2017
%
% The objective of this coursework was
% to create an animated clock. The clock 
% I created has rigid movement in the
% second and minute hands, but smooth
% movement for the hour hand. It is
% displayed in 3D, with images being used
% to display the clock face and the current
% date. Additionally, images are used to
% decorate the clock depending on the
% season, including adding seasonal
% textures to the clock face. The clock
% also has a thick wood bezel and a 
% battery pack on its base.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%}

%% Setup. Clears variables and holds on for drawing.
% Set up
close all % Closes all figures
clear % Clear variables
clear functions % Clears functions
hold on % Holds on to keep drawing objects
axis off; % Don't display axis in figure

%% Getting the time. Determining the season.
% Gathering the initial date for first draw
c = clock; % Getting time
initialDay = fix(c(3)); % Getting day
initialMonth = fix(c(2)); % Getting month
initialYear = fix(c(1)); % Getting year

% Gets the season at the start of the program
initialSeason = getSeason(initialMonth);

%% Creating the basic clock, including clock face and bezel.
% Creating clock face and base
[ox,oy] = circle(0,0,10,360); % Circle for drawing face and base
face = fill3(ox,oy,ones(1,361), 'w', 'LineWidth', 2, 'FaceLighting', 'none');
base = fill3(ox,oy,zeros(1,361), 'k', 'LineWidth', 2);

% Creating battery pack on clock base
batteryX = [-3 -3; 3 3]; % X coordinates for battery
batteryY = [0 3; 0 3]; % Y coordinates for battery
batteryZ = [-0.01 -0.01; -0.01 -0.01]; % Z coordinates for battery
batteryIm = imread('battery.jpg'); % Reading in battery image
% Adding battery pack to bottom of clock
batteryH = surf(batteryX,batteryY,batteryZ,'CData',...
    batteryIm,'FaceColor','texturemap');
set(batteryH,'LineStyle', 'none'); % Removes bounded line from image

% Creating circle for hour hand.
% This circle will be used to draw the
% hour hand as it spins around the clock.
[ix,iy]= circle(0,0,5,360);

% Creating clock center
[cx,cy] = circle(0,0,.25,360); % Circle for drawing center of clock
center = fill3(cx,cy,ones(1,361)+.001,'k');

% Creating wood bezel
I = imread('woodtex.jpg'); % Reads in texture
% Wood border is made by making larger and larger
% cylinders with a .01 radius difference between them
for i = 10:.01:11 % Loop for generating border
    [bx,by,bz] = cylinder(i); % Creates border at radius i
    warp(bx,by,bz*1.5,I) % Assigns texture to border
end

% Creating circle for notches
[nx,ny] = circle(0,0,9.2,360); % Circle is used for drawing notches
z = ones(1,361); % Lines will be at z = 1 in 3D

for a = 0:6:354
    % For hour notches. Line is thicker
    if mod(a, 30) == 0 % For every 30 degrees
        n = line([ox(a + 1) nx(a + 1)], [oy(a + 1) ny(a + 1)], [z(a + 1) z(a + 1)]);
        set(n(1), 'LineWidth', 2); % Sets line width to 2 pixels
        set(n(1), 'Color', 'k'); % Makes line color black
    % For minute/second notches. Thin line
    else
        n = line([ox(a + 1) nx(a + 1)], [oy(a + 1) ny(a + 1)], [z(a + 1) z(a + 1)]);
        set(n(1), 'LineWidth', .25); % Sets line width to .25 pixels
        set(n(1), 'Color', 'k'); % Makes line color black
    end
end

%% Creating clock numbers
% Adds numbers on clock. I do this by reading in
% images and placing them on the clock. Each number
% has a respective image and is placed onto the clock
% face.
twelveIm = imread('twelve.jpg'); % Reads in image for #12
nineIm = imread('nine.jpg'); % Reads in image for #9
sixIm = imread('six.jpg'); % Reads in image for #6
threeIm = imread('three.jpg'); % Reads in image for #3
tenIm = imread('ten.jpg'); % Reads in image for #10
elevenIm = imread('eleven.jpg'); % Reads in image for #11
oneIm = imread('one.jpg'); % Reads in image for #1
twoIm = imread('two.jpg'); % Reads in image for #2
fourIm = imread('four.jpg'); % Reads in image for #4
fiveIm = imread('five.jpg'); % Reads in image for #5
sevenIm = imread('seven.jpg'); % Reads in image for #7
eightIm = imread('eight.jpg'); % Reads in image for #8

xBound = [-1 -1; 1 1]; % X coordinates for #12 & #6. Y coordinates for #9
xBound2 = [-6 -6; -8 -8]; % X coordinates for #2, #4, #8 & #10
xBound3 = [-5 -5; -3 -3]; % X coordinates for #1, #5, #7 & #11
yBound = [-9 -7; -9 -7]; % Y coordinates for #12. X coordinates for #9
yBound2 = [9 7; 9 7]; % Y coordinates for #6. X coordinates for #3
yBound3 = [-5 -3; -5 -3]; % Y coordinates for #2, #4, #8 & #10
yBound4 = [-8 -6; -8 -6]; % Y coordinates for #1, #5, #7 & #11
zBound = [1.01 1.01; 1.01 1.01]; % Z coordinates for all numbers
% Creating number 12 as image on bounded square.
twelveNum = surf(xBound,yBound,zBound,'CData',twelveIm,'FaceColor','texturemap');
set(twelveNum,'LineStyle', 'none'); % Removes line for bounded square
% Creating number 9 as image on bounded square.
nineNum = surf(yBound,xBound,zBound,'CData',nineIm,'FaceColor','texturemap');
set(nineNum,'LineStyle', 'none'); % Removes line for bounded square
% Creating number 3 as image on bounded square.
threeNum = surf(yBound2,xBound,zBound,'CData',threeIm,'FaceColor','texturemap');
set(threeNum,'LineStyle', 'none'); % Removes line for bounded square
% Creating number 6 as image on bounded square.
sixNum = surf(xBound,yBound2,zBound,'CData',sixIm,'FaceColor','texturemap');
set(sixNum,'LineStyle', 'none'); % Removes line for bounded square
tenNum = surf(xBound2,yBound3,zBound,'CData',tenIm,'FaceColor','texturemap');
set(tenNum,'LineStyle', 'none'); % Removes line for bounded square
twoNum = surf(-xBound2,yBound3,zBound,'CData',twoIm,'FaceColor','texturemap');
set(twoNum,'LineStyle', 'none'); % Removes line for bounded square
eightNum = surf(xBound2,-yBound3,zBound,'CData',eightIm,'FaceColor','texturemap');
set(eightNum,'LineStyle', 'none'); % Removes line for bounded square
fourNum = surf(-xBound2,-yBound3,zBound,'CData',fourIm,'FaceColor','texturemap');
set(fourNum,'LineStyle', 'none'); % Removes line for bounded square
elevenNum = surf(xBound3,yBound4,zBound,'CData',elevenIm,'FaceColor','texturemap');
set(elevenNum,'LineStyle', 'none'); % Removes line for bounded square
oneNum = surf(-xBound3,yBound4,zBound,'CData',oneIm,'FaceColor','texturemap');
set(oneNum,'LineStyle', 'none'); % Removes line for bounded square
sevenNum = surf(xBound3,-yBound4,zBound,'CData',sevenIm,'FaceColor','texturemap');
set(sevenNum,'LineStyle', 'none'); % Removes line for bounded square
fiveNum = surf(-xBound3,-yBound4,zBound,'CData',fiveIm,'FaceColor','texturemap');
set(fiveNum,'LineStyle', 'none'); % Removes line for bounded square


%% Creating clock date
% Adding date to clock
dateIm = imread('white.jpg'); % Reads in image for date
% Make the date a string for displaying
dateString = strcat(num2str(initialDay,'%02d'),'/',...
    num2str(initialMonth,'%02d'), '/', ...
    num2str(initialYear,'%04d'));
% Inserts the string onto the image
dateIm = insertText(dateIm,[130 30],dateString,...
    'FontSize',80,'BoxColor','white','TextColor','black');
dateIm = imrotate(dateIm,270); % Rotates 270 degrees
dateIm = flip(dateIm); % Flips image
dateX = [-4 -4; 4 4]; % X coordinates for date position
dateY = [-2 -4; -2 -4]; % Y coordinates for date position
dateZ = [-1.01 -1.01; -1.01 -1.01]; % Z coordinates for date position
% Creates the surface for the date to be displayed
dateH = surf(dateX,dateY,dateZ,...
    'CData',dateIm,'FaceColor','texturemap');
set(dateH, 'LineStyle', 'none'); % Removes line on surface
% Rotates the surface so it is in the right position
direction = [0 1 0]; % Rotate in Y
rotate(dateH,direction,180); % Rotate 180 degrees

%% Decorating based on season
% Putting the season on the clock for the first draw
springPic = imread('spring.jpg'); % Image from Free Clip Art
summerPic = imread('summer.jpg'); % Image from Clipart Panda
autumnPic = imread('autumn.jpg'); % Image from Sweet Clip Art
winterPic = imread('winter.jpg'); % Image from Clipart Panda

% If statement for drawing season on clock
if initialSeason == 'Spring'
    % Adds main season graphic to clock
    seasonH = surf([-2 -2; 2 2],[2 6; 2 6],...
        zBound,'CData',springPic,'FaceColor','texturemap');
    set(seasonH,'LineStyle', 'none'); % Removes line for bounded square
    % Art from freeclipartimage.com
    seasonPart = imread('springParticle.jpg');
elseif initialSeason == 'Summer'
    % Adds main season graphic to clock
    seasonH = surf([-2 -2; 2 2],[2 6; 2 6],...
        zBound,'CData',summerPic,'FaceColor','texturemap');
    set(seasonH,'LineStyle', 'none'); % Removes line for bounded square
    % Art from cliparting.com
    seasonPart = imread('summerParticle.jpg');
elseif initialSeason == 'Autumn'
    % Adds main season graphic to clock
    seasonH = surf([-2 -2; 2 2],[2 6; 2 6],...
        zBound,'CData',autumnPic,'FaceColor','texturemap');
    set(seasonH,'LineStyle', 'none'); % Removes line for bounded square
    % Art from thebalance.com
    seasonPart = imread('autumnParticle.jpg');
elseif initialSeason == 'Winter'
    % Adds main season graphic to clock
    seasonH = surf([-2 -2; 2 2],[2 6; 2 6],...
        zBound,'CData',winterPic,'FaceColor','texturemap');
    set(seasonH,'LineStyle', 'none'); % Removes line for bounded square
    % Art from Wikimedia Commons
    seasonPart = imread('winterParticle.jpg');
end

% Coordinates for seasonal particles
particleX1 = [-4 -4; -3 -3]; % X coordinates for particles 1 & 2
particleX2 = [-2.5 -2.5; -1.5 -1.5]; % X coordinates for particles 1 & 2
particleY1 = [4 3; 4 3]; % Y coordinates for particles 3 & 4
particleY2 = [1 0; 1 0]; % Y coordinates for particles 3 & 4

% Drawing seasonal particles
particleH1 = surf(particleX1,particleY1,...
        zBound,'CData',seasonPart,'FaceColor','texturemap');
particleH2 = surf(-particleX1,particleY1,...
        zBound,'CData',seasonPart,'FaceColor','texturemap');
particleH3 = surf(particleX2, particleY2,...
        zBound,'CData',seasonPart,'FaceColor','texturemap');
particleH4 = surf(-particleX2, particleY2,...
        zBound,'CData',seasonPart,'FaceColor','texturemap');
% Removes lines around surfaces
set(particleH1,'LineStyle', 'none'); 
set(particleH2,'LineStyle', 'none');
set(particleH3,'LineStyle', 'none');
set(particleH4,'LineStyle', 'none');

%% Animation loop
% Setting the axis to equal and determining viewing angle
axis equal;
view(0,40);
% Loop for animation
while(true)
    % Refreshing clock
    c = clock;
    
    % Getting time (rounded, as we won't deal with fractional seconds)
    day = fix(c(3)); % Getting day
    month = fix(c(2)); % Getting month
    year = fix(c(1)); % Getting year
    initialSeconds = fix(c(6)); % Getting seconds
    initialMinutes = fix(c(5)); % Getting minutes
    h = fix(c(4)); % Getting hours
    season = getSeason(month); % Gets the season
    
    % Changing date if it's changed
    if(initialDay ~= day || initialMonth ~= month || ...
            initialYear ~= year)
        % Saving new date
        initialDay = day;
        initialMonth = month;
        initialYear = year;
        delete(dateH);
        % Adding date to clock
        dateIm = imread('white.jpg'); % Reads in image for date
        % Make the date a string for displaying
        dateString = strcat(num2str(initialDay,'%02d'),'/',...
            num2str(initialMonth,'%02d'), '/', ...
            num2str(initialYear,'%04d'));
        % Inserts the string onto the image
        dateIm = insertText(dateIm,[130 30],dateString,...
            'FontSize',80,'BoxColor','white','TextColor','black');
        dateIm = imrotate(dateIm,270); % Rotates 270 degrees
        dateIm = flip(dateIm); % Flips image
        dateX = [-4 -4; 4 4]; % X coordinates for date position
        dateY = [-2 -4; -2 -4]; % Y coordinates for date position
        dateZ = [-1.01 -1.01; -1.01 -1.01]; % Z coordinates for date position
        % Creates the surface for the date to be displayed
        dateH = surf(dateX,dateY,dateZ,...
            'CData',dateIm,'FaceColor','texturemap');
        set(dateH, 'LineStyle', 'none'); % Removes line on surface
        % Rotates the surface so it is in the right position
        direction = [0 1 0]; % Rotate in Y
        rotate(dateH,direction,180); % Rotate 180 degrees
    end
    
    if(season ~= initialSeason)
        initialSeason = season;
        delete(seasonH);
        delete(particleH1);
        delete(particleH2);
        delete(particleH3);
        delete(particleH4);
        % If statement for drawing season on clock
        if initialSeason == 'Spring'
            % Adds main season graphic to clock
            seasonH = surf([-2 -2; 2 2],[2 6; 2 6],...
                zBound,'CData',springPic,'FaceColor','texturemap');
            set(seasonH,'LineStyle', 'none'); % Removes line for bounded square
            % Art from freeclipartimage.com
            seasonPart = imread('springParticle.jpg');
        elseif initialSeason == 'Summer'
            % Adds main season graphic to clock
            seasonH = surf([-2 -2; 2 2],[2 6; 2 6],...
                zBound,'CData',summerPic,'FaceColor','texturemap');
            set(seasonH,'LineStyle', 'none'); % Removes line for bounded square
            % Art from cliparting.com
            seasonPart = imread('summerParticle.jpg');
        elseif initialSeason == 'Autumn'
            % Adds main season graphic to clock
            seasonH = surf([-2 -2; 2 2],[2 6; 2 6],...
                zBound,'CData',autumnPic,'FaceColor','texturemap');
            set(seasonH,'LineStyle', 'none'); % Removes line for bounded square
            % Art from thebalance.com
            seasonPart = imread('autumnParticle.jpg');
        elseif initialSeason == 'Winter'
            % Adds main season graphic to clock
            seasonH = surf([-2 -2; 2 2],[2 6; 2 6],...
                zBound,'CData',winterPic,'FaceColor','texturemap');
            set(seasonH,'LineStyle', 'none'); % Removes line for bounded square
            % Art from Wikimedia Commons
            seasonPart = imread('winterParticle.jpg');
        end

        particleX1 = [-4 -4; -3 -3]; % X coordinates for particles 1 & 2
        particleX2 = [-2.5 -2.5; -1.5 -1.5]; % X coordinates for particles 1 & 2
        particleY1 = [4 3; 4 3]; % Y coordinates for particles 3 & 4
        particleY2 = [1 0; 1 0]; % Y coordinates for particles 3 & 4

        % Drawing seasonal particles
        particleH1 = surf(particleX1,particleY1,...
                zBound,'CData',seasonPart,'FaceColor','texturemap');
        particleH2 = surf(-particleX1,particleY1,...
                zBound,'CData',seasonPart,'FaceColor','texturemap');
        particleH3 = surf(particleX2, particleY2,...
                zBound,'CData',seasonPart,'FaceColor','texturemap');
        particleH4 = surf(-particleX2, particleY2,...
                zBound,'CData',seasonPart,'FaceColor','texturemap');
        % Removes lines around surfaces
        set(particleH1,'LineStyle', 'none'); 
        set(particleH2,'LineStyle', 'none');
        set(particleH3,'LineStyle', 'none');
        set(particleH4,'LineStyle', 'none');
    end

    % Converting time to clock hands using indexes on circles
    s = clockDegrees(initialSeconds); % Determines where second hand will point
    m = clockDegrees(initialMinutes); % Determines where minute hand will point
    
    % These conditions determine the hour hand position
    if h > 12 % Makes hour between 0 and 11
        h = h - 12;
    end
    if and(h >= 0, h <= 3) % For 12 to 3
        h = 91 - (h * 30);
    end
    if and(h > 3, h <= 12) % For 4 to 12
        h = (271 - ((h - 6) * 30));
    end
    
    %{ 
    % Matrix for hour hand.
    %}
    hrHand = [[0 ix(h)]; [0 iy(h)]; [1 1]];

    %{ 
    % Calculating hour hand's position on clock
    % to do this, I rotate the hour hand by how many
    % degrees it rotates in a second for every second
    % that has passed. Understand that the number
    % -0.00833333333 is how many degrees the hour hand
    % moves per second
    %}
    secondsPassed = (initialMinutes * 60) + initialSeconds;
    degreesRotated = 0.00833333333 * secondsPassed;
    % Creating rotational matrix
    initialRotate = [[cosd(degreesRotated) sind(degreesRotated) 0]; 
        [-sind(degreesRotated) cosd(degreesRotated) 0]; [0 0 1]];
    % Applying matrix
    hrHand = hrHand' * initialRotate; % Rotate hour hand
    hrHand = hrHand'; % Untranspose matrix
    
    % Drawing the arms. Z is always 1, hence [1 1]
    hour = line(hrHand(1,:), hrHand(2,:), [1.02 1.02]); % Using rotated matrix from earlier
    minute = line([0 ox(m)], [0 oy(m)], [1.02 1.02]); % Using index determined from earlier
    second = line([0 ox(s)], [0 oy(s)], [1.02 1.02]); % Using index determined from earlier
    
    % Coloring the hands
    set(hour, 'Color', 'b', 'LineWidth', 2); % Hour hand (blue)
    set(minute, 'Color', 'b', 'LineWidth', 2); % Minute hand (blue)
    set(second, 'Color', 'r', 'LineWidth', 2); % Second hand (red)
    
    % Waiting for animation. Waits .01 seconds
    pause(.01);
    
    % Delete hands for next draw. Does this by deleting handle
    delete(second); % Destroys second hand handle
    delete(minute); % Destroys minute hand handle
    delete(hour); % Destroys hour hand handle
end