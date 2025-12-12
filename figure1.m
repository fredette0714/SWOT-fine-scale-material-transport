clear;clc;
qq = figure;
set(gcf, 'units', 'normalized','position',[.1 .1 .6 .6],'PaperPositionMode', 'auto');
set(gcf, 'InvertHardCopy', 'off'); 
set(gcf, 'Color', [1 1 1])

load('I:\inout\code\10\fig1.mat');
%% 温度
%0604
hh1 = axes('position',[.05 0.7 .2 .25]);
m_proj('miller','lat',[7,15], 'long',[105,115]);
m_pcolor(lon_sst,lat_sst,sst(:,:,4)');
hold on
m_contour(lon_sst,lat_sst,sst(:,:,4)',[302,302],'color','k');
m_grid('linestyle','none','tickdir','in','linewidth',1,'xtick',[],'ytick',[7:2:15],'fontsize',10);
shading flat;
m_coast('patch',[.6 .6 .6],'edgecolor','none');
title('2023-06-04 SST','fontsize',15);
m_text(105.25,14.5,'a','fontsize',15)
caxis([301 304])
m_contour(lon_sst,lat_sst,sst(:,:,1)',[302,302],'color','k','linestyle','--');


%0608
hh1 = axes('position',[.05 0.4 .2 .25]);
m_proj('miller','lat',[7,15], 'long',[105,115]);
m_pcolor(lon_sst,lat_sst,sst(:,:,8)');
hold on
m_contour(lon_sst,lat_sst,sst(:,:,8)',[302,302],'color','k');
m_grid('linestyle','none','tickdir','in','linewidth',1,'xtick',[],'ytick',[7:2:15],'fontsize',10);
shading flat;
m_coast('patch',[.6 .6 .6],'edgecolor','none');
title('2023-06-08 SST','FontSize',15);
m_text(105.25,14.5,'e','fontsize',15)
caxis([301 304])
m_contour(lon_sst,lat_sst,sst(:,:,1)',[302,302],'color','k','linestyle','--');

%0612
hh1 = axes('position',[.05 0.1 .2 .25]);
m_proj('miller','lat',[7,15], 'long',[105,115]);
m_pcolor(lon_sst,lat_sst,sst(:,:,12)');
hold on
m_contour(lon_sst,lat_sst,sst(:,:,12)',[302,302],'color','k');
m_grid('linestyle','none','tickdir','in','linewidth',1,'xtick',[105:5:115],'ytick',[7:2:15],'fontsize',10);
shading flat;
m_coast('patch',[.6 .6 .6],'edgecolor','none');
title('2023-06-12 SST','FontSize',15);
m_text(105.25,14.5,'i','fontsize',15)
caxis([301 304])
cb = colorbar('horiz');
set(cb,'Position',[0.0625 0.05 0.175 0.01],'FontSize',12);
xlabel(cb,'K','Position',[302.5 -1.5],'FontSize',12)
m_contour(lon_sst,lat_sst,sst(:,:,1)',[302,302],'color','k','linestyle','--');

%% kiko swot 4d
hh1 = axes('position',[.255 0.7 .2 .25]);
m_pcolor(lon,lat,SSD_4d_summer_swot);
m_coast('patch',[.6 .6 .6],'edgecolor','none');
title('SWOT 4 day SSD','FontSize',15)
colormap(nclCM(225))
caxis([0 1])
hold on
m_contour(lon,lat,SSD_4d_summer_swot,[0.25,0.25],'color','k');
m_grid('linestyle','none','tickdir','in','linewidth',1,'xtick',[],'ytick',[]);
m_coast('patch',[.6 .6 .6],'edgecolor','none');
m_text(105.25,14.5,'b','fontsize',15)


%% kiko avsio 4d
hh1 = axes('position',[.46 0.7 .2 .25]);
m_pcolor(lon,lat,SSD_4d_summer_DUACS);
m_coast('patch',[.6 .6 .6],'edgecolor','none');
title('DUACS 4 day SSD','FontSize',15)
caxis([0 1])
hold on
m_contour(lon,lat,SSD_4d_summer_DUACS,[0.25,0.25],'color','k');
m_grid('linestyle','none','tickdir','in','linewidth',1,'xtick',[],'ytick',[]);
m_coast('patch',[.6 .6 .6],'edgecolor','none');
m_text(105.25,14.5,'c','fontsize',15)

%% kiko swot 8d
hh1 = axes('position',[.255 0.4 .2 .25]);
m_pcolor(lon,lat,SSD_8d_summer_swot);
m_coast('patch',[.6 .6 .6],'edgecolor','none');
title('SWOT 8 day SSD','FontSize',15)
colormap(nclCM(225))
caxis([0 1])
hold on
m_contour(lon,lat,SSD_8d_summer_swot,[0.25,0.25],'color','k');
m_grid('linestyle','none','tickdir','in','linewidth',1,'xtick',[],'ytick',[]);
m_coast('patch',[.6 .6 .6],'edgecolor','none');
m_text(105.25,14.5,'f','fontsize',15)


%% kiko avsio 8d
hh1 = axes('position',[.46 0.4 .2 .25]);
m_pcolor(lon,lat,SSD_8d_summer_DUACS);
m_coast('patch',[.6 .6 .6],'edgecolor','none');
title('DUACS 8 day SSD','FontSize',15)
caxis([0 1])
hold on
m_contour(lon,lat,SSD_8d_summer_DUACS,[0.25,0.25],'color','k');
m_grid('linestyle','none','tickdir','in','linewidth',1,'xtick',[],'ytick',[]);
m_coast('patch',[.6 .6 .6],'edgecolor','none');
m_text(105.25,14.5,'g','fontsize',15)

%% kiko swot 12d
hh1 = axes('position',[.255 0.1 .2 .25]);

m_pcolor(lon,lat,SSD_12d_summer_swot);
title('SWOT 12 day SSD','FontSize',15)
colormap(nclCM(225))
caxis([0 1])
hold on
m_contour(lon,lat,SSD_12d_summer_swot,[0.25,0.25],'color','k');
m_grid('linestyle','none','tickdir','in','linewidth',1,'xtick',[105:5:115],'ytick',[],'fontsize',10);
m_coast('patch',[.6 .6 .6],'edgecolor','none');
m_text(105.25,14.5,'j','fontsize',15)

%% kiko avsio 8d
hh1 = axes('position',[.46 0.1 .2 .25]);

m_pcolor(lon,lat,SSD_12d_summer_DUACS);
hold on
m_contour(lon,lat,SSD_12d_summer_DUACS,[0.25,0.25],'color','k');
m_coast('patch',[.6 .6 .6],'edgecolor','none');
title('DUACS 12 day SSD','FontSize',15)
caxis([0 1])
m_grid('linestyle','none','tickdir','in','linewidth',1,'xtick',[105:5:115],'ytick',[],'fontsize',10);
m_text(105.25,14.5,'k','fontsize',15)
cb = colorbar('horiz');
set(cb,'Position',[0.2675 0.05 0.38 0.01],'xtick',0:0.25:1,'FontSize',12);
m_text(111.75,4.25,'Sink','fontsize',13,'color','r')
m_text(94.5,4.25,'Scoure','fontsize',13,'color','b')

%% 4day lb
hh1 = axes('position',[.675 0.7 .2 .25]);

[lon,lat] = meshgrid(lon,lat);lon = lon';lat = lat';
pox = (lon>105&lon<115);
poy = (lat>7&lat<15);
h1 = m_scatter(lon(LB_avsio_4>1.75&pox&poy),lat(LB_avsio_4>1.75&pox&poy),4,[30,136,229]./255,'filled');
hold on
h2 = m_scatter(lon(LB_swot_4>1.75&pox&poy),lat(LB_swot_4>1.75&pox&poy),4,[244,67,54]./255,'filled');

m_grid('linestyle','none','tickdir','in','linewidth',1,'xtick',[],'ytick',[],'fontsize',10);
m_coast('patch',[.6 .6 .6],'edgecolor','none');
m_text(105.25,14.5,'d','fontsize',15)
title('4 day B_{L}','FontSize',15)
lgd  = legend([h2,h1],{'B_{L S}>1.75','B_{L D}>1.75'})
lgd.ItemTokenSize = [2,20];
set(lgd,'Box','off','Position',[0.675 0.85,0.1 0.05],'FontSize',9)
%% 8day lb
hh1 = axes('position',[.675 0.4 .2 .25]);
h1 = m_scatter(lon(LB_avsio_8>2&pox&poy),lat(LB_avsio_8>2&pox&poy),4,[30,136,229]./255,'filled');
hold on
h2 = m_scatter(lon(LB_swot_8>2&pox&poy),lat(LB_swot_8>2&pox&poy),4,[244,67,54]./255,'filled');

m_grid('linestyle','none','tickdir','in','linewidth',1,'xtick',[],'ytick',[],'fontsize',10);
m_coast('patch',[.6 .6 .6],'edgecolor','none');
m_text(105.25,14.5,'h','fontsize',15)
title('8 day B_{L}','FontSize',15)
lgd  = legend([h2,h1],{'B_{L S}>2','B_{L D}>2'})
lgd.ItemTokenSize = [2,20];
set(lgd,'Box','off','Position',[0.675 0.55,0.1 0.05],'FontSize',9)


%% 12day lb
hh1 = axes('position',[.675 0.1 .2 .25]);

h1 = m_scatter(lon(LB_avsio_12>2.5&pox&poy),lat(LB_avsio_12>2.5&pox&poy),4,[30,136,229]./255,'filled');
hold on
h2 = m_scatter(lon(LB_swot_12>2.5&pox&poy),lat(LB_swot_12>2.5&pox&poy),4,[244,67,54]./255,'filled');

m_grid('linestyle','none','tickdir','in','linewidth',1,'xtick',[105:5:115],'ytick',[],'fontsize',10);
m_coast('patch',[.6 .6 .6],'edgecolor','none');
m_text(105.25,14.5,'l','fontsize',15)
title('12 day B_{L}','FontSize',15)
lgd  = legend([h2,h1],{'B_{L S}>2.5','B_{L D}>2.5'})
lgd.ItemTokenSize = [2,20];
set(lgd,'Box','off','Position',[0.675 0.25,0.1 0.05],'FontSize',9)
print('-dtiff','-r400','fig1.tiff') 
