clear;clc;
qqq = figure;
set(gcf, 'units', 'normalized','position',[.1 .1 .6 .6],'PaperPositionMode', 'auto');
set(gcf, 'InvertHardCopy', 'off');
set(gcf, 'Color', [1 1 1])

load('I:\inout\code\10\fig2.mat');
%% 画图，slope summer
hh1 = axes('position',[.1 0.725-0*0.225 .3 .225],'LineWidth', 1.2);

h1 = plot(2:40,slope_summer,'LineWidth',2,'Color',[200,40,30]./255,'LineStyle','-');
hold on
h2 = plot(2:40,slope_winter,'LineWidth',2,'Color',[30,136,155]./255,'LineStyle','-');
set(hh1,'YTick',[0:0.35:0.7],'YTickLabel',{'0%','35%','70%'},'FontSize',12)
ylim([-0.1 0.7])
xlim([0 40])
set(hh1,'xTick',[0:10:50],'XTickLabel',{});
line([0 40],[0 0],'linestyle','--','linewidth',1,'marker','None','color','k');
ylb = ylabel({'Difference in';'Numbers of Sink';'or Source Nodes'},'FontSize',13);
text(.3,0.65,'a','fontsize',15)
lgd = legend([h1,h2],{'Summer','Winter'},'Box','off','FontSize',12);
lgd.ItemTokenSize = [10, 3];
%% 画图 LB
hh1 = axes('position',[.1 0.725-1*0.225 .3 .225],'LineWidth', 1.2);
x = 2:40;
y1 = sign(bl_summer);
plot(x,log10(abs(bl_summer)),'LineWidth',2,'Color',[200,40,30]./255,'LineStyle','-','Marker','none')
hold on
scatter(x(y1==-1),log10(abs(bl_summer(y1==-1))),50,[200,40,30]./255);

y1 = sign(bl_winter);
plot(x,log10(abs(bl_winter)),'LineWidth',2,'Color',[30,136,155]./255,'LineStyle','-','Marker','none')
scatter(x(y1==-1),log10(abs(bl_winter(y1==-1))),50,[30,136,155]./255);

set(hh1,'YTick',[-2:2:4],'XTickLabel',{},'YTicklabel',{'10^{-2}','1','10^2','10^4'},'FontSize',12)
ylim([-3 4])
xlim([0 40])
set(hh1,'xTick',[0:10:40]);
ylb = ylabel({'Difference in';'Nomarlized B_{L}'},'FontSize',13);
text(.3,3.5,'b','fontsize',15)
set(ylb,'Position',[-5.25,0])



%% 画图 方向差异
hh1 = axes('position',[.1 0.725-2*0.225 .3 .225],'LineWidth', 1.2);
plot(3:40,difference_summer,'LineWidth',2,'Color',[200,40,30]./255,'LineStyle','-');
hold on
plot(3:40,difference_winter,'LineWidth',2,'Color',[30,136,155]./255,'LineStyle','-');

ylim([-0.5 3.5])
set(hh1,'ycolor','k','FontSize',12,'YTick',[-0.5 0 1.75 3.5],'yticklabel',{'-0.5','0','1.75','3.5'});
line([0 40],[0 0],'linestyle','--','linewidth',1,'marker','None','color','k');
text(0.4,3.25,'c','fontsize',15)
ylb =ylabel({'Variation Rate of Bias';' in direction (° day^{-1})'},'FontSize',13);
set(ylb,'Position',[-5.25,1.25])
set(hh1,'xTick',[0:10:50],'FontSize',12);
xlabel('Duration (day)','FontSize',13)

%% ssd差异
hh1 = axes('position',[.45 0.65 .15 .295],'LineWidth', 1.2);
m_proj('miller','lat',[0,25], 'long',[101,121]);

m_pcolor(lon,lat,nanmean(diff_ssd,3));
caxis([-.75 .75])
hold on;
m_coast('patch',[.6 .6 .6],'edgecolor','none');
m_text(101.5,24,'d','fontsize',15);
colormap(nclCM(225))
m_grid('linestyle','none','tickdir','in','linewidth',1,'xtick',[101,110,120],'ytick',[0:5:25],'FontSize',12);
title('Summer Difference in SSD','FontSize',14)

%% lb差异
hh1 = axes('position',[.45 0.265 .15 .295],'LineWidth', 1.2);
m_proj('miller','lat',[0,25], 'long',[101,121]);
m_pcolor(lon,lat,nanmean(diff_lb,3));
caxis([-1.5 1.5])
hold on;
m_coast('patch',[.6 .6 .6],'edgecolor','none');
m_text(101.5,24,'e','fontsize',15);
m_grid('linestyle','none','tickdir','in','linewidth',1,'xtick',[101,110,120],'ytick',[0:5:25],'FontSize',12);
title('Summer Difference in B_{L}','FontSize',14)

%% ssd差异 winter
hh1 = axes('position',[.65 0.65 .15 .295],'LineWidth', 1.2);
m_proj('miller','lat',[0,25], 'long',[101,121]);
m_pcolor(lon,lat,nanmean(diff_ssd,3));
caxis([-.75 .75])
hold on;
m_coast('patch',[.6 .6 .6],'edgecolor','none');
m_text(101.5,24,'f','fontsize',15);
colormap(nclCM(225))
m_grid('linestyle','none','tickdir','in','linewidth',1,'xtick',[101,110,120],'ytick',[0:5:25],'FontSize',12);
title('Winter Difference in SSD','FontSize',14)
cm = colorbar();
set(cm,'Position',[0.8 0.65 0.01 0.295],'xtick',linspace(-.75,.75,5),'xticklabel',{'-75%','-37.5%','0','37.5%','75%'},'FontSize',12)

%% lb差异 winter
hh1 = axes('position',[.65 0.265 .15 .295],'LineWidth', 1.2);
m_proj('miller','lat',[0,25], 'long',[101,121]);
m_pcolor(lon,lat,nanmean(diff_lb,3));
caxis([-1.5 1.5])
hold on;
m_coast('patch',[.6 .6 .6],'edgecolor','none');
m_text(101.5,24,'g','fontsize',15);
m_grid('linestyle','none','tickdir','in','linewidth',1,'xtick',[101,110,120],'ytick',[0:5:25],'FontSize',12);
title('Winter Difference in B_{L}','FontSize',14)
cm = colorbar();
set(cm,'Position',[0.8 0.265 0.01 0.295],'xtick',linspace(-1.5,1.5,5),'xticklabel',{'-150%','-75%','0','75%','150%'},'FontSize',12)

print('-dtiff','-r400','fig2.tiff')

