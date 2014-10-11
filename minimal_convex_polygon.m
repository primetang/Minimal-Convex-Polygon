function polygon = minimal_convex_polygon(points)
    % delaunay triangulation and save all the edges
	triangles = sort(delaunay(points(1, :), points(2, :)), 2);
	lines = zeros(size(triangles, 1) * 3, 2);
	for i = 1:size(triangles, 1)
		lines(3 * i - 2,:) = [triangles(i, 1), triangles(i, 2)];
		lines(3 * i - 1,:) = [triangles(i, 1), triangles(i, 3)];
		lines(3 * i,:) = [triangles(i, 2), triangles(i, 3)];
    end
    % delete the edges which appeared many times
	[~, IA] = unique(lines, 'rows');
	lines = setdiff(lines(IA, :), lines(setdiff(1:size(lines, 1), IA), :), 'rows');
    % get the boundary points serial number of minimal convex polygon
	seqs = zeros(size(lines, 1) + 1,1);
	seqs(1:2) = lines(1, :);
	lines(1, :) = [];
	for i = 3:size(seqs)
		pos = find(lines == seqs(i - 1));
		row = rem(pos - 1, size(lines, 1)) + 1;
		col = ceil(pos / size(lines, 1));
		seqs(i) = lines(row, 3 - col);
		lines(row, :) = [];
    end
    % get the boundary points of minimal convex polygon
	polygon = points(:, seqs);
end