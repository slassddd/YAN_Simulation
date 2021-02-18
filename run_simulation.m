load('仿真数据_2021-01-19 14-53-09');
load('IOBusInfo_V1000.mat')
t0 = 10;
tf = 700;
IMU = IN_SENSOR.IMU1;
IMU.ts = round(median(diff(IMU.time)),3);
gpsmode = 'ublox'; % ublox um482
switch gpsmode
    case 'ublox'
        GPSdata = IN_SENSOR.ublox1;
    case 'um482'
        GPSdata = IN_SENSOR.um482;
end
gpspos = [GPSdata.Lat*pi/180,GPSdata.Lon*pi/180,GPSdata.height];
gpsvel = [GPSdata.velE,GPSdata.velN,-GPSdata.velD];
avp_all = [...
    FlightLog_Original.Filter.algo_NAV_pitchd*pi/180,...
    FlightLog_Original.Filter.algo_NAV_rolld*pi/180,...
    -FlightLog_Original.Filter.algo_NAV_yawd*pi/180,...
    FlightLog_Original.Filter.algo_NAV_Ve,...
    FlightLog_Original.Filter.algo_NAV_Vn,...
    -FlightLog_Original.Filter.algo_NAV_Vd,...
    FlightLog_Original.Filter.algo_NAV_latd*pi/180,...
    FlightLog_Original.Filter.algo_NAV_lond*pi/180,...
    FlightLog_Original.Filter.algo_NAV_alt,...
    FlightLog_Original.Filter.time_cal];
avpTime = FlightLog_Original.Filter.time_cal;

avp_above = avp_all(avpTime(:,end)>=t0&avpTime(:,end)<=tf,:);
idx_IMU_above = find(IMU.time>=t0&IMU.time<=tf);
idx_GPS_above = find(GPSdata.time>=t0&GPSdata.time<=tf);
idx0_IMU = idx_IMU_above(1);
idxf_IMU = idx_IMU_above(end);
idx0_GPS = idx_GPS_above(1);
idxf_GPS = idx_GPS_above(end);

trj.avp = avp_above;

glvs
glv.rootpath = 0;
glv.datapath = 0;
%% run
out = sim('test_YAN_fusion');
%% plot
pk = zeros(size(out.kf.Pxk.Data,3),size(out.kf.Pxk.Data,1));
for i = 1:size(out.kf.Pxk,3)
    pk(i,:) = diag(out.kf.Pxk.Data(:,:,i))';
end
xkpk = [permute(out.kf.xk.Data,[3,1,2]),pk,out.kf.xk.Time]; %[out.kf.xk; diag(kf.Pxk); time]';
kfxfb = [permute(out.kf.xfb.Data,[3,1,2]),out.kf.xfb.Time];
avp = [permute(out.ins.avp.Data,[3,1,2]),out.ins.avp.Time];
GPSdata = IN_SENSOR.ublox1;

plot_avp(avp,trj.avp,GPSdata,xkpk,t0,tf);
plot_kfxfb