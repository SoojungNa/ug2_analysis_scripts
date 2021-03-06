close all
clear;
addpath(genpath('C:\Users\SN\Google Drive\z.functions'));
load('C:\Users\SN\Google Drive\z.functions\plots\colors.mat');


%% !UPDATE! Ouput
folder = 'C:\Users\SN\Google Drive\p22.UG2_covid\200403_t1\2.model';
outfile = fullfile('f4g_online_delta_offer_correl.pdf');  % cut 390x370


%% !UPDATE! Data [nP x 1]
load(fullfile(folder, 'param_20t.mat')); 
data1 = param_ic{4}(:, 5); %x = data1

load(fullfile(folder, 'offer.mat')); 
data2 = offer_ic; %y = data2



%% !UPDATE! Labels
xL = 'Expected influence (C)';
yL = 'Mean offer (C)';
% to change the line:
% e.g., [sprintf('Self-reported \n perceived control'), ' (%)']


%% Statistics
[r, p] = corrcoef(data1, data2, 'rows', 'pairwise'); % r = .76, p<.001
rr = sprintf('%.2f', r(2));
pp = sprintf('%.10f', p(2));
disp(['r = ', rr, ', p = ', pp]);


%% !UPDATE! Axis Limit
xlim = [-2 2];
ylim = [0 10];


%% !UPDATE! Texts
text1 = ['r = ', rr, sprintf('\n p < 10^{-61}')];
text1x = -1; % center
text1y = 8; % bottom of th efirst line


%% Dots
x = data1;
y = data2;


%% Dot formats (size/color)
% c = uisetcolor
dsz = 2;        % dot size
Blue0 = [0.6 0.8 1];    %153 204 255    light
Blue1 = [.27 .47 .78];  %70 120 200     dark
ic_dot_color = Blue1;  %70 120 200     dark



%% Size & Position
w = 105;    % chart width 120
h = 110;    % chart height 125
blank = 20;
xlabelspace = 30;   % one line = 15, two lines = 30
ylabelspace = 30;
Fw = w + 2*blank + ylabelspace;
Fh = h + 2*blank + xlabelspace;
F = figure('Position', [500 300 Fw Fh]); % left BOTTOM width height

subplot('Position', ...
    [(blank+ylabelspace)/Fw (blank+xlabelspace)/Fh w/Fw h/Fh]) 
    % left TOP width height
    
        
%% Draw charts
s1 = scatter(x, y, dsz, ic_dot_color, 'filled');
s1.MarkerFaceAlpha = 0.3;
h = lsline;
%set(h(1), 'color', 'r')

hold on

% s2 = text(text1x, text1y, text1, ...
%          'HorizontalAlignment', 'center', 'FontName', 'Arial', 'FontSize', 8);

xlabel(xL);
ylabel(yL);
ytickformat('%3.0f');
xtickformat('%3.0f');

set(gca, 'box', 'off', 'FontName', 'Arial', 'FontSize', 8, ...
    'xLim', xlim, 'yLim', ylim, 'TickLength', [0 0], 'xtick', [-2 0 2], 'ytick', [0 5 10]);

saveas(F, outfile);