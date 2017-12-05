function roads = initializeRoads(nodes)
  roads = zeros(157, 2);
  in = load('RoadsWithOneWay3.mat');
  cell1 = struct2cell(in);
  cell2 = cell1{1};
  roads = cell2mat(cell2{1});
  roads(150,:) = [55 9];
  roads(151,:) = [9 55];
  roads(152,:) = [56 50];
  roads(153,:) = [50 56];
  roads(154,:) = [57 2];
  roads(155,:) = [57 2];
  roads(156,:) = [58 51];
  roads(157,:) = [51 58];
end
