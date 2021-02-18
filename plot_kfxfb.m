figure;
subplot(331)
plot(kfxfb(:,end),kfxfb(:,1));hold on;grid on;
ylabel('pitch [rad]')
subplot(334)
plot(kfxfb(:,end),kfxfb(:,2));hold on;grid on;
ylabel('roll [rad]')
subplot(337)
plot(kfxfb(:,end),kfxfb(:,3));hold on;grid on;
ylabel('yaw [rad]')
subplot(332)
plot(kfxfb(:,end),kfxfb(:,4));hold on;grid on;
ylabel('Ve [m/s]')
subplot(335)
plot(kfxfb(:,end),kfxfb(:,5));hold on;grid on;
ylabel('Vn [m/s]')
subplot(338)
plot(kfxfb(:,end),kfxfb(:,6));hold on;grid on;
ylabel('Vu [m/s]')
subplot(333)
plot(kfxfb(:,end),kfxfb(:,4));hold on;grid on;
ylabel('Lat [rad]')
subplot(336)
plot(kfxfb(:,end),kfxfb(:,5));hold on;grid on;
ylabel('Lon [rad]')
subplot(339)
plot(kfxfb(:,end),kfxfb(:,6));hold on;grid on;
ylabel('Alt [m]')