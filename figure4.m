clear;clc;
qq = figure;
set(gcf, 'units', 'normalized','position',[.1 .1 .6 .6],'PaperPositionMode', 'auto');
set(gcf, 'InvertHardCopy', 'off'); 
set(gcf, 'Color', [1 1 1])
load("fig4.mat")

lat_ele         = ncread('J:\GEBCO_2024_sub_ice_topo.nc','lat');
lon_ele         = ncread('J:\GEBCO_2024_sub_ice_topo.nc','lon');
elevation       = ncread('J:\GEBCO_2024_sub_ice_topo.nc','elevation');
pox = find(lon_ele>=110&lon_ele<=115);poy = find(lat_ele>=7&lat_ele<=15);
elevation   = elevation(pox,poy);
[lon_ele,lat_ele] = meshgrid(lon_ele(pox),lat_ele(poy));lon_ele = lon_ele'; lat_ele = lat_ele';
clearvars pox poy


%% 高精度夏季swot

hh1 = axes('position',[.4 0.55 .375 .35]);
lon_x=100:0.1:125;
lat_y=0:0.1:25;

m_proj('miller','lat',[7,15], 'long',[105,115]);
q= m_pcolor(lon_x,lat_y,swot_module_id);
m_grid('linestyle','none','tickdir','in','linewidth',1,'xtick',[105,110,115],'ytick',7:2:15,'fontsize',10);
shading flat;
m_coast('patch',[.6 .6 .6],'edgecolor','none');
caxis([0 10])


q1 = nclCM(290);
q1(2,:) = [255,150,135]./255;
q1(3,:) = [255,208,130]./255;
q1(5,:) = [130,176,210]./255;
q1([1,4,6:12],:) = repmat([255,255,255]./255,9,1);

colormap(hh1,q1)
m_text(105.25,14.5,'b','fontsize',17.5)
title('SWOT 6 day Infomap','FontSize',15)

%% 叠加drifter
hold on

for iii = [1,2,4];
    id_unique = unique(id(q_swot_end==iii));
    for jjj = 1:length(id_unique)
         temp_time = time(id==id_unique(jjj));
         temp_lon  = lon(id==id_unique(jjj));
         temp_lat  = lat(id==id_unique(jjj));
         if sum(abs(diff(temp_time))<0.05)==length(temp_time)-1;
            m_plot(lon(id==id_unique(jjj)),lat(id==id_unique(jjj)),'color',[1 1 1],'linewidth',1);
           
         else
             flag = find(abs(diff(temp_time))>0.05);
             flag = [1;flag;length(temp_lon)];
             for kkk = 1:length(flag)-1
                m_plot(temp_lon(flag(kkk)+1:flag(kkk+1)-1),temp_lat(flag(kkk)+1:flag(kkk+1)-1),'color',[1 1 1],'linewidth',1);
                 
             end
         end
    end
end

 flag = time == floor(time)&lon>=105&lon<=115&lat>=7&lat<=15;
 m_scatter(lon(q_swot_end==2&flag'),lat(q_swot_end==2&flag'),10.5,[213,113,5]./255,'filled')
 m_scatter(lon(q_swot_end==1&flag'),lat(q_swot_end==1&flag'),10.5,[208,32,8]./255,'filled')
 m_scatter(lon(q_swot_end==4&flag'),lat(q_swot_end==4&flag'),10.5,[46,76,230]./255,'filled')
 m_scatter(lon(q_swot_end==4&flag'),lat(q_swot_end==4&flag'),10.5,[46,76,230]./255,'filled')

%% 叠加南沙群岛
hold on
m_contour(lon_ele,lat_ele,elevation,[0 0 0],'linewidth',2,'color','k') 

%% 高精度夏季ducas
hh1 = axes('position',[.075 0.55 .375 .35]);

m_proj('miller','lat',[7,15], 'long',[105,115]);
m_pcolor(lon_x,lat_y,duacs_module_id);
m_grid('linestyle','none','tickdir','in','linewidth',1,'xtick',[105,110,115],'ytick',0:5:25,'fontsize',10);
shading flat;
m_coast('patch',[.6 .6 .6],'edgecolor','none');
caxis([0 10])
colormap(hh1,q1)
m_text(105.25,14.5,'a','fontsize',17.5)
title('DUACS 6 day Infomap','FontSize',15)

%% 叠加drifter
hold on
for iii = [1,2];
    id_unique = unique(id(q_ducas_end==iii));
    for jjj = 1:length(id_unique)
         temp_time = time(id==id_unique(jjj));
         temp_lon  = lon(id==id_unique(jjj));
         temp_lat  = lat(id==id_unique(jjj));
         if sum(abs(diff(temp_time))<0.05)==length(temp_time)-1;
            m_plot(lon(id==id_unique(jjj)),lat(id==id_unique(jjj)),'color',[1 1 1],'linewidth',1);
         else
             flag = find(abs(diff(temp_time))>0.05);
             flag = [1;flag;length(temp_lon)];
             for kkk = 1:length(flag)-1
                 m_plot(temp_lon(flag(kkk)+1:flag(kkk+1)-1),temp_lat(flag(kkk)+1:flag(kkk+1)-1),'color',[.9 .9 .9],'linewidth',1);
             end
         end
    end
end

flag = time == floor(time);

hold on
q_ducas_end(isnan(q_ducas_end)) = 10000;

m_scatter(lon(q_ducas_end==2&flag'),lat(q_ducas_end==2&flag'),10.5,[213,113,5]./255,'filled')
m_scatter(lon(q_ducas_end==1&flag'),lat(q_ducas_end==1&flag'),10.5,[208,32,8]./255,'filled')
hold on
m_contour(lon_ele,lat_ele,elevation,[0 0 0],'linewidth',2,'color','k') 

%% drifter统计

%summer swot
hh1 = axes('position',[.4+0.065 0.225 .245 .225]);
data_for_bar = q_swot_sum([1,2,4],[1,2,4]);

%橙色区域出发
b = bar(1,data_for_bar(1,:)./sum(data_for_bar(1,:)),0.25,'stacked','EdgeColor','none');%0.75是柱形图的宽，可以更改
set(b(1),'FaceColor',[250,127,111]./255)
set(b(2),'FaceColor',[255,208,110]./255)
set(b(3),'FaceColor',[130,176,210]./255)
%黄色区域出发
hold on
b = bar(2,data_for_bar(2,:)./sum(data_for_bar(2,:)),0.25,'stacked','EdgeColor','none');%0.75是柱形图的宽，可以更改
set(b(1),'FaceColor',[250,127,111]./255)
set(b(2),'FaceColor',[255,208,110]./255)
set(b(3),'FaceColor',[130,176,210]./255)
%绿色出发
b = bar(3,data_for_bar(3,:)./sum(data_for_bar(3,:)),0.25,'stacked','EdgeColor','none');%0.75是柱形图的宽，可以更改
set(b(1),'FaceColor',[250,127,111]./255)
set(b(2),'FaceColor',[255,208,110]./255)
set(b(3),'FaceColor',[130,176,210]./255)

lgd = legend(b,{'Southern','Northern','SCSCF'},'FontSize',12,'Box','off');
set(lgd,'Position',[0.5 0.775 0.05 0.025]);
lgd.ItemTokenSize = [15,20];

ylim([0 1])
xlim([0.5 3.5])
set(hh1,'XTick',1:3,'XTickLabel',{'Southern','Northern','SCSCF'},'YTick',0:0.5:1,'FontSize',13);
title('Drifters in SWOT Communities','FontSize',15)
text(0.55,0.9,'d','FontSize',17.5);
xlabel('Initial Community','FontSize',13)

%summer ducas
hh1 = axes('position',[.14 0.225 .245 .225]);
data_for_bar_ducas = q_ducas_sum([1,2],[1,2]);

%橙色区域出发
b = bar(1,data_for_bar_ducas(1,:)./sum(data_for_bar_ducas(1,:)),0.25,'stacked','EdgeColor','none');%0.75是柱形图的宽，可以更改
set(b(1),'FaceColor',[250,127,111]./255)
set(b(2),'FaceColor',[255,208,110]./255)

%黄色区域出发
hold on
b = bar(2,(data_for_bar_ducas(2,:))./sum(data_for_bar_ducas(2,:)),0.25,'stacked','EdgeColor','none');%0.75是柱形图的宽，可以更改
set(b(1),'FaceColor',[250,127,111]./255)
set(b(2),'FaceColor',[255,208,110]./255)
lgd = legend(b,{'Southern','Northern'},'FontSize',12,'Box','off');
set(lgd,'Position',[0.175 0.775 0.05 0.025]);
lgd.ItemTokenSize = [15,20];
ylim([0 1])
xlim([0. 3])
set(hh1,'XTick',1:2,'XTickLabel',{'Southern','Northern'},'YTick',0:0.5:1,'FontSize',13);
ylb = ylabel({'Percentage of Final';'Community'},'FontSize',13)
title('Drifters in DUACS Communities','FontSize',15)
text(0.05,.9,'c','FontSize',17.5);
xlabel('Initial Community','FontSize',13)

clearvars -except qq


print('-dtiff','-r400','fig4.tiff') 

