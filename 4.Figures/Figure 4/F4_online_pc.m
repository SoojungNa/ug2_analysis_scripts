
%% Plot inputs
load('sample3_online_participants\pc.mat');
data = [pc_ic pc_nc];

x_tick_labels = {'C','U'};
x_tick = [1 2];
xlim = [0.5 2.5];

y_title = [sprintf('Self-reported \n controllability'), ' (%)'];
ylim = [0 100];


% Mean line
design.s1.color = black;
design.s1.linewidth = 1.5;

% SEM patch
design.s2.color = black;
design.s2.fa = 0.3;

% Individual lines
design.s3.color = grey_light;           % black
design.s3.fa = 0.3; %0.3


% Draw plot
plot_lines08(data, ...
    x_tick_labels, x_tick, xlim, ...
    y_title, ylim, ...
    design);
