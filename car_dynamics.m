
initial_position = 0.0;  % meters
initial_velocity = 0.0;  % meters per second
  
time_step = 0.01;        % seconds
total_time = 25.0;       % seconds
time = 0:time_step:total_time;
acceleration=ones(size(time));
v_ideal = ones(size(time));
s_ideal = ones(size(time));
v_real= ones(size(time));
s_real=ones(size(time));
acceleration(1)=2;
s_ideal(1) = initial_position;
v_ideal(1) = initial_velocity;
s_real(1) = initial_position;
v_real(1) = initial_velocity;

for i = 2:length(time)
    acceleration(i)=acceleration(1)+((((time(i)-7.5)^2)/-11.25)+5);
    v_ideal(i) = v_ideal(i-1) +  (acceleration(i)+acceleration(i-1))*0.5* time_step;
    v_real(i) = v_real(i-1) + (acceleration(i)+acceleration(i-1))*0.5 * time_step *(0.5 + 0.5*rand);
    s_ideal(i) = s_ideal(i-1) + (v_ideal(i)+v_ideal(i-1))*0.5 * time_step;
    s_real(i) = s_real(i-1) + (v_real(i)+v_real(i-1))*0.5 * time_step*(0.5 + 0.5*rand);
   
end

subplot(1, 2, 1);
plot(time, s_ideal, 'k', 'LineWidth', 2);  % Use square brackets for time and s
hold on
plot(time, s_real, 'r', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Position (m)');
title('Distance vs Time');

subplot(1, 2, 2);
plot(time, v_ideal, 'k', 'LineWidth', 2);  % Use square brackets for time and s
hold on
plot(time, v_real, 'r', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Velocity(m/s)');
title('Velocity vs Time');

figure;
width=0.5;
height=0.2;
% y_lower=s_real(1)-height;
% y_upper=max(s_real)+height;
y_lower=-50;
y_upper=1400;
car_fig=plot(s_real(1),0,"s","Markersize",10,"MarkerFaceColor","blue");
xlabel("Time")
ylabel("Displacement")
title("Car");
axis([min(time) max(time) y_lower y_upper] );

for i=1:length(time)
    set(car_fig,"Xdata",time(i),"Ydata",s_real(i))
    drawnow;
    pause(0.09);
end

