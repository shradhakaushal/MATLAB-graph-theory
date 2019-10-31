function forest = find_BFS_forest(A)
%find a BFS forest of the graph with adjacency matrix A
edge_list = find_edge_list(A);
dark = 1:length(A);
yellow = [];
red = [];
forest = [];
while not(isempty(dark))
    if isempty(yellow)
        yellow = [yellow dark(1)];
        forest = [forest [dark(1) 0]'];
        dark(1) = [];
    else
        new_discoveries = setdiff(setdiff(edge_list{yellow(1), 1}, red, 'stable'), yellow, 'stable');
        yellow = [yellow new_discoveries];
        forest = [forest [new_discoveries; yellow(1).*ones(1, length(new_discoveries))]];
        red = [red yellow(1)];
        for i = 2 : length(yellow)
            dark(dark == yellow(i)) = [];
        end
        yellow(1) = [];
    end
end

