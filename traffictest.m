clear all
clf
clc

numberOfIterations = 1500;

nodes = initializeNodes();
parkingNodeIndices = [length(nodes)-1:length(nodes)]
roads = initializeRoads(nodes);
parkingRoads = [length(roads) - 1:length(roads)]

cars = initializeCars(nodes, roads)
    
routes = [1 2 3 4 1 2 3 4 0;1 2 3 4 1 2 3 4 0;1 2 3 4 1 2 3 4 0];


global positionIndex;
positionIndex = 1;
global roadIndex;
roadIndex = 2;
global maxVelocityIndex;
maxVelocityIndex = 3;
global currentVelocityIndex;
currentVelocityIndex = 4;
global maxAccelerationIndex;
maxAccelerationIndex = 5;
global maxDeaccelerationIndex;
maxDeaccelerationIndex = 6;
global visionIndex;
visionIndex = 7;
global nextRoadIndex;
nextRoadIndex = 8;
global nextRoadInRouteIndex; 
nextRoadInRouteIndex = 9;
global timeStep;
timeStep = 0.1;
global maxVelocityInIntersection;
maxVelocityInIntersection = 15;

cars = -sortrows(-cars, [2 1])

for i = 1:numberOfIterations
  initializedCarIndices = find(sum(cars'));
  unInitializedCarIndices = find(sum(cars')==0);
  cars(initializedCarIndices,:) = updateCars(cars(initializedCarIndices,:), nodes, roads,routes);

  plotCoordinates = parameterCoordinates(cars(initializedCarIndices,:), nodes, roads);
  if ~isempty(unInitializedCarIndices)
%    roads(unInitializedCarIndices(1),:)
    cars(unInitializedCarIndices(1),:) = generateNewCars(parkingRoads(1));
  end
  
  velocities = cars(:,currentVelocityIndex);
  positions = cars(:,positionIndex);
  clf;
  scatter(plotCoordinates(:,1), plotCoordinates(:,2), 'filled')
  hold on
  %text(-5, 102, num2str(velocities));
  %text(-5, 10, num2str(positions, 4));
  text(0, 190, strcat('Time: ',num2str(i*timeStep)), 'fontsize', 18);
  plotRoads(roads, nodes);
  drawnow
  velos(i,:) = velocities;
end

