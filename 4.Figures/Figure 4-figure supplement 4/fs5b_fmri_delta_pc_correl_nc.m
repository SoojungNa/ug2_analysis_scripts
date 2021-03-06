close all
clear;
addpath(genpath('C:\Users\SN\Google Drive\z.functions'));


%% !UPDATE! Ouput
outdir = cd;
outfile = 'plot_correl_delta_pc_nc.pdf';  % cut 390x370


%% !UPDATE! Data [nP x 1]
load(fullfile('C:\Users\SN\Google Drive\p1.UG2_fMRI\180422_eta.8\2.model', 'param.mat')); 
load('C:\Users\SN\Google Drive\p1.UG2_fMRI\180422_eta.8\2.model\pc.mat');

data1 = param_nc(:, 5); %x = data1
data2 = pc_nc; %y = data2


%% !UPDATE! Labels
xL = ['Modelled' sprintf('\n controllability (U)')];
yL = ['Self-reported' sprintf('\n controllability (U)')];

% xL = ['Estimated control (\delta) ' sprintf('\n (No Control)')];
% yL = ['Estimated control (\delta) ' sprintf('\n (In Control)')];
% to change the line:
% e.g., [sprintf('Self-reported \n perceived control'), ' (%)']


%% Statistics
[r, p] = corrcoef(data1, data2, 'rows', 'pairwise'); % r = .76, p<.001
rr = sprintf('%.2f', r(2));
pp = sprintf('%.2f', p(2));
disp(['r = ', rr, ', p = ', pp]);


%% !UPDATE! Axis Limit
xlim = [-2 2];
ylim = [0 100];


%% !UPDATE! Texts
text1 = ['r = ', rr, sprintf('\n p < 0.05')];
text1x = -1;
text1y = -1;


%% Dots
x = data1;
y = data2;


%% Dot formats (size/color)
% c = uisetcolor
dsz = 5;        % dot size
Blue1 = [.27 .47 .78];  %70 120 200     dark
Grey1 = [.4 .4 .4];  %70 120 200     dark



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
s1 = scatter(x, y, dsz, Grey1, 'filled');
lsline

hold on

% s2 = text(text1x, text1y, text1, ...
%          'HorizontalAlignment', 'center', 'FontName', 'Arial', 'FontSize', 8);

xlabel(xL);
ylabel(yL);
ytickformat('%3.0f');
xtickformat('%3.0f');

set(gca, 'box', 'off', 'FontName', 'Arial', 'FontSize', 8, ...
    'xLim', xlim, 'yLim', ylim, 'TickLength', [0 0], 'xtick', [-2 0 2], 'ytick', [0 100]);

saveas(F, outfile);