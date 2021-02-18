function plot_avp(avp,avp_true,GPSdata,xkpk,t0,tf)
idx = find(GPSdata.time>=t0&GPSdata.time<=tf);
figure;
subplot(531)
plot(avp(:,end),avp(:,1)*180/pi);hold on;
plot(avp_true(:,end),avp_true(:,1)*180/pi);hold on;
ylabel('pitch[deg]')
subplot(532)
plot(avp(:,end),avp(:,2)*180/pi);hold on;
plot(avp_true(:,end),avp_true(:,2)*180/pi);hold on;
ylabel('roll[deg]')
subplot(533)
plot(avp(:,end),avp(:,3)*180/pi);hold on;
plot(avp_true(:,end),avp_true(:,3)*180/pi);hold on;
ylabel('yaw[deg]')
subplot(534)
plot(avp(:,end),avp(:,4));hold on;
plot(avp_true(:,end),avp_true(:,4));hold on;
plot(GPSdata.time(idx),GPSdata.velE(idx));hold on;
ylabel('Ve')
subplot(535)
plot(avp(:,end),avp(:,5));hold on;
plot(avp_true(:,end),avp_true(:,5));hold on;
plot(GPSdata.time(idx),GPSdata.velN(idx));hold on;
ylabel('Vn')
subplot(536)
plot(avp(:,end),avp(:,6));hold on;
plot(avp_true(:,end),avp_true(:,6));hold on;
plot(GPSdata.time(idx),-GPSdata.velD(idx));hold on;
ylabel('Vu')
subplot(537)
plot(avp(:,end),avp(:,7));hold on;
plot(avp_true(:,end),avp_true(:,7));hold on;
plot(GPSdata.time(idx),GPSdata.Lat(idx)*pi/180);hold on;
ylabel('lat')
subplot(538)
plot(avp(:,end),avp(:,8));hold on;
plot(avp_true(:,end),avp_true(:,8));hold on;
plot(GPSdata.time(idx),GPSdata.Lon(idx)*pi/180);hold on;
ylabel('lon')
subplot(539)
plot(avp(:,end),avp(:,9));hold on;
plot(avp_true(:,end),avp_true(:,9));hold on;
plot(GPSdata.time(idx),GPSdata.height(idx));hold on;
ylabel('alt[m]')
% 
idx = 9;
%
idx = idx + 1;
subplot(5,3,idx)
plot(xkpk(:,end),xkpk(:,idx));hold on;
ylabel('eb x')
idx = idx + 1;
subplot(5,3,idx)
plot(xkpk(:,end),xkpk(:,idx));hold on;
ylabel('eb y')
idx = idx + 1;
subplot(5,3,idx)
plot(xkpk(:,end),xkpk(:,idx));hold on;
ylabel('eb z')
%
idx = idx + 1;
subplot(5,3,idx)
plot(xkpk(:,end),xkpk(:,idx));hold on;
ylabel('db x')
idx = idx + 1;
subplot(5,3,idx)
plot(xkpk(:,end),xkpk(:,idx));hold on;
ylabel('db y')
idx = idx + 1;
subplot(5,3,idx)
plot(xkpk(:,end),xkpk(:,idx));hold on;
ylabel('db z')
end