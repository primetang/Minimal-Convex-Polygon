points = [0, 15, 30, 26, 26, 0, 20, 10; 0, 3, 10, 20, 12, 0, 12, 4];
figure(1);
for i = 1:size(points,2)
    hold on;
    plot(points(1, i), points(2, i), '*r', 'LineWidth', 4);
end
polygon = minimal_convex_polygon(points);
hold on;
plot(polygon(1, :), polygon(2, :), 'LineWidth', 2);