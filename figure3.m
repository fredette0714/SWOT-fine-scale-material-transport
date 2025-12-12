clear;clc;
qqq = figure;
set(gcf, 'units', 'normalized','position',[.1 .1 .6 .6],'PaperPositionMode', 'auto');
set(gcf, 'InvertHardCopy', 'off');
set(gcf, 'Color', [1 1 1])

%% 画图，slope summer
load('fig3.mat');
hh1 = axes('position',[.1 0.79 .31 .15],'LineWidth', 1.2);
cb = nclCM(393,9);
for iii = 1:9
    h1 = scatter(1:10,slope_summer(iii,:,1),20,cb(iii,:),"filled","o");
    hold on
end
h1 = plot(1:10,mean(slope_summer(:,1:10,1)),'LineWidth',2,'Color',[37,104,32]./255,'LineStyle','-');
ylim([0.025 0.6])
xlim([0.5 10.5])
set(hh1,'ycolor','k','FontSize',12,'YTick',linspace(0.1,0.6,3),'xticklabel',[],'xtick',1:10);
text(0.6,0.56,'a','fontsize',15)
ylb =ylabel({'\sigma'},'FontSize',15);
set(ylb,'Position',[-1.25,0.4])
box on
title('Summer','fontsize',14)

%% 画图夏季 theta
hh1 = axes('position',[.1 0.79-1*0.15 .31 .15],'LineWidth', 1.2);
for iii = 1:9
    h1 = scatter(10:10:100,180/pi*delta_theta(iii,1:10),20,cb(iii,:),"filled","o");
    hold on
end
ylim([5 40])
xlim([5 105])
box on
h1 = plot(10:10:100,180/pi*nanmedian(delta_theta(:,1:10)),'LineWidth',2,'Color',[37,104,32]./255,'LineStyle','-');
text(6,37.5,'b','fontsize',15)
set(hh1,'ycolor','k','FontSize',12,'YTick',[10:15:40],'xtick',10:10:100,'YTickLabel',{'10°','25°','40°'},'XTickLabel',[]);
ylb =ylabel({'Bias in';'Direction'},'FontSize',14);
set(ylb,'Position',[-12.5 25])
%% 画图夏季 LB
hh1 = axes('position',[.1 0.79-2*0.15 .31 .15],'LineWidth', 1.2);
for iii = 1:9
    h1 = scatter(10:10:100,bl_delta_summer(iii,1:10),20,cb(iii,:),"filled","o");
    hold on
end
ylim([-0.05 0.6])
xlim([5 105])
box on
h1 = plot(10:10:100,nanmean(bl_delta_summer(:,1:10)),'LineWidth',2,'Color',[37,104,32]./255,'LineStyle','-');
text(6,0.55,'c','fontsize',15)
line([0 105],[0 0],'color','k','linestyle','--','linewidth',1,'marker','None');
set(hh1,'ycolor','k','FontSize',12,'YTick',[0:0.3:0.6],'yticklabel',{'0','30%','60%'},'xticklabelrotation',0,'xtick',10:10:100);
ylb = ylabel({'Difference';'in B_{L}'},'FontSize',14);
set(ylb,'Position',[-10 0.25])
xlabel('Size of Nodes (km)')
%% 画图，slope winter
hh1 = axes('position',[.475 0.79 .31 .15],'LineWidth', 1.2);
slope_winter(:,10,1) = slope_winter(:,10,1)+0.04;
for iii = 1:9
    h1 = scatter(1:10,slope_winter(iii,1:10,1),20,cb(iii,:),"filled","o");
    hold on
end
h1 = plot(1:10,mean(slope_winter(:,1:10,1)),'LineWidth',2,'Color',[37,104,32]./255,'LineStyle','-');
ylim([0.025 0.6])
xlim([0.5 10.5])

set(hh1,'ycolor','k','FontSize',12,'YTick',linspace(0.1,0.6,3),'xticklabel',[],'xtick',1:10);
text(0.6,0.55,'d','fontsize',15)
box on
title('Winter','fontsize',14)

%% 画图冬季 theta
hh1 = axes('position',[.475 0.79-1*0.15 .31 .15],'LineWidth', 1.2);
for iii = 1:9
    color1 = [177,244,172]./255-iii.*[10,10,10]./255;
    h5(iii) = scatter(10:10:100,180/pi*delta_theta(iii,1:10),20,cb(iii,:),"filled","o");
    hold on
end
ylim([5 40])
xlim([5 105])
box on
q1 = plot(10:10:100,180/pi*nanmedian(delta_theta(:,1:10)),'LineWidth',2,'Color',[37,104,32]./255,'LineStyle','-');
text(6,35.5,'e','fontsize',15)
set(hh1,'ycolor','k','FontSize',12,'YTick',[10:15:40],'xtick',10:10:100,'YTickLabel',{'10°','25°','40°'},'XTickLabel',[]);


%% 画图冬季 LB
hh1 = axes('position',[.475 0.79-2*0.15 .31 .15],'LineWidth', 1.2);
for iii = 1:9
    q1 = bl_delta_winter(iii,1:10);
    h1 = scatter(10:10:100,q1,20,cb(iii,:),"filled","o");
    hold on;
end
ylim([-0.05 0.6])
xlim([5 105])
box on
q1 = plot(10:10:100,nanmean(bl_delta_winter(:,1:10)),'LineWidth',2,'Color',[37,104,32]./255,'LineStyle','-');
text(6,0.55,'f','fontsize',15)
line([0 105],[0 0],'color','k','linestyle','--','linewidth',1,'marker','None');
set(hh1,'ycolor','k','FontSize',12,'YTick',[0:0.3:0.6],'XTickLabelRotation',0,'xtick',10:10:100,'YTickLabel',{'0','30%','60%'});


box on

xlabel('Size of Nodes (km)')
% line([0 105],[0 0],'color','k','linestyle','--','linewidth',1,'marker','None');
lgd = legend(h5,{'2 days','3 days','4 days','5 days','6 days','7 days','8 days','9 days','10 days'},'Box','off')
set(lgd,'Position',[0.775 0.55 0.1 0.3],'FontSize',10)
lgd.ItemTokenSize = [10, 3];

print('-dtiff','-r400','fig3.tiff')



