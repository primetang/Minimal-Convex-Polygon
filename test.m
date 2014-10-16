points = [0, 15, 30, 26, 26, 0, 20, 10; 0, 3, 10, 20, 12, 0, 12, 4];
plot(points(1, :), points(2, :), '*r', 'LineWidth', 4);
polygon = minimal_convex_polygon(points);
hold on;
plot(polygon(1, :), polygon(2, :), 'LineWidth', 2);