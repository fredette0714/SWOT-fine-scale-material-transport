clear;clc;
qq = figure;
set(gcf, 'units', 'normalized','position',[.1 .1 .6 .6],'PaperPositionMode', 'auto');
set(gcf, 'InvertHardCopy', 'off'); 
set(gcf, 'Color', [1 1 1])
load('fig5.mat')

lat_ele         = ncread('J:\GEBCO_2024_sub_ice_topo.nc','lat');
lon_ele         = ncread('J:\GEBCO_2024_sub_ice_topo.nc','lon');
elevation       = ncread('J:\GEBCO_2024_sub_ice_topo.nc','elevation');
pox = find(lon_ele>=110&lon_ele<=115);poy = find(lat_ele>=7&lat_ele<=15);
elevation   = elevation(pox,poy);
[lon_ele,lat_ele] = meshgrid(lon_ele(pox),lat_ele(poy));lon_ele = lon_ele'; lat_ele = lat_ele';
clearvars pox poy
%% Summer DUACS
hh1 = axes('position',[.05 0.6 .225 .3]);

m_proj('miller','lat',[7,15], 'long',[105,115]);
m_pcolor(lon,lat,ssd_duacs_summer);
m_grid('linestyle','none','tickdir','in','linewidth',1,'fontsize',11,'xtick',[105:5:115],'ytick',[7:2:15]);
shading flat;
m_coast('patch',[.6 .6 .6],'edgecolor','none');
title('DUACS Summer SSD','fontsize',15)
caxis([0 1])
colormap(nclCM(142))
m_text(105.25,14.5,'a','fontsize',17.5)
hold on
m_contour(lon_ele,lat_ele,elevation,[0 0 0],'linewidth',2,'color','k') 

%% SUMMER SWOT
hh1 = axes('position',[.305 0.6 .225 .3]);
m_proj('miller','lat',[7,15], 'long',[105,115]);
m_pcolor(lon,lat,ssd_swot_summer);
m_grid('linestyle','none','tickdir','in','linewidth',1,'fontsize',11,'xtick',[105:5:115],'ytick',[7:2:15]);
shading flat;
m_coast('patch',[.6 .6 .6],'edgecolor','none');
title('SWOT Summer SSD','fontsize',15)
caxis([0 1])
colormap(nclCM(142))
m_text(105.25,14.5,'b','fontsize',17.5)
hold on
m_contour(lon_ele,lat_ele,elevation,[0 0 0],'linewidth',2,'color','k') 

%% Winter DUCAS
hh1 = axes('position',[.05 0.2 .225 .3]);
m_proj('miller','lat',[7,15], 'long',[105,115]);
m_pcolor(lon,lat,ssd_duacs_winter);
m_grid('linestyle','none','tickdir','in','linewidth',1,'fontsize',11,'xtick',[105:5:115],'ytick',[7:2:15]);
shading flat;
m_coast('patch',[.6 .6 .6],'edgecolor','none');
title('DUACS Winter SSD','fontsize',15)
caxis([0 1])
colormap(nclCM(142))
m_text(105.25,14.5,'d','fontsize',17.5)

cb = colorbar('horiz');
set(cb,'Position',[0.105 0.125 0.375 0.01],'xtick',0:0.2:1,'FontSize',11)
hold on
m_contour(lon_ele,lat_ele,elevation,[0 0 0],'linewidth',2,'color','k') 


%% Winter swot
hh1 = axes('position',[.305 0.2 .225 .3]);
m_proj('miller','lat',[7,15], 'long',[105,115]);
m_pcolor(lon,lat,ssd_swot_winter);
m_grid('linestyle','none','tickdir','in','linewidth',1,'fontsize',11,'xtick',[105:5:115],'ytick',[7:2:15]);
shading flat;
m_coast('patch',[.6 .6 .6],'edgecolor','none');
title('SWOT Winter SSD','fontsize',15)
caxis([0 1])
colormap(nclCM(142))
m_text(105.25,14.5,'e','fontsize',17.5)
hold on
m_contour(lon_ele,lat_ele,elevation,[0 0 0],'linewidth',2,'color','k') 

%% 画种群
hh1 = axes('position',[.56 0.6 .225 .3]);
m_proj('miller','lat',[7,15], 'long',[105,115]);
m_pcolor(longitude,latitude,adv_type_plankton_summer');
m_grid('linestyle','none','tickdir','in','linewidth',1,'fontsize',11,'xtick',[105:5:115],'ytick',[7:2:15]);
shading flat;
m_coast('patch',[.6 .6 .6],'edgecolor','none');

m_text(105.25,14.5,'c','fontsize',17.5)
title('Summer Plankton Type','fontsize',15);
cp = [250,127,111;98,210,102;255,208,110;90,136,180]./255;
colormap(hh1,cp)

% 冬季藻种
hh1 = axes('position',[.56 0.2 .225 .3]);
m_proj('miller','lat',[7,15], 'long',[105,115]);

pc3 = adv_type_plankton_winter';pc3(pc3~=3) = nan;
pc3 = m_pcolor(longitude,latitude,pc3);
hold on
pc4 = adv_type_plankton_winter';pc4(pc4~=4) = nan;
pc4 = m_pcolor(longitude,latitude,pc4);
pc5 = adv_type_plankton_winter';pc5(pc5~=5) = nan;
pc5 = m_pcolor(longitude,latitude,pc5);
pc6 = adv_type_plankton_winter';pc6(pc6~=6) = nan;
pc6 = m_pcolor(longitude,latitude,pc6);
m_grid('linestyle','none','tickdir','in','linewidth',1,'fontsize',11,'xtick',[105:5:115],'ytick',[7:2:15]);
shading flat;
m_coast('patch',[.6 .6 .6],'edgecolor','none');

colormap(hh1,cp)

m_text(105.25,14.5,'f','fontsize',17.5)
title('Winter Plankton Type','fontsize',15);

lgd = legend([pc3,pc4,pc5,pc6],{'Greenalgae','Haptophytes','Prochlorophytes','Prokaryotes'},'Box','off','NumColumns', 2,'FontSize',11);
lgd.ItemTokenSize = [20,20];
set(lgd,'position',[0.4 0.08,0.55 0.075])

print('-dtiff','-r400','fig5.tiff') 