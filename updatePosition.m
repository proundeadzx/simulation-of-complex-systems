function [cars, routes] = updatePosition(cars,nodes,roads,routes)
    % Uppdate postion and road parameter 
    global positionIndex;
    global currentVelocityIndex;
    global roadIndex;
    global nextRoadIndex;
    global timeStep;
    global nextRoadInRouteIndex;
   
%     needNewRoads = find(cars(:,roadIndex) == cars(:,nextRoadIndex));
%     for i=1:length(needNewRoads)
%       index = needNewRoads(i);
%       currentRoad = cars(index, roadIndex);
%       cars(index, nextRoadIndex) = getNextRoadIndex(currentRoad, roads);
%     end
    
    oldPosition = cars(:,positionIndex);
    velocity = cars(:,currentVelocityIndex);
    currentRoad = cars(:,roadIndex);
    
    distVector = nodes(roads(currentRoad,1),:)-nodes(roads(currentRoad,2),:);
    lengthOldRoad = sqrt(distVector(:,1).^2+distVector(:,2).^2); 

    distanceTraveled = oldPosition + timeStep*velocity;
    
    roadDecision = distanceTraveled > lengthOldRoad;
    
    [routes, cars] = updateRoutesCars(cars,routes,roadDecision,nodes,roads);
    
    [cars, routes] = updatNextRoadInRouteIndex(cars,routes,roadDecision, roads);
    
    nextRoad = cars(:,nextRoadIndex);
    newPosition = oldPosition + timeStep*velocity -roadDecision.*lengthOldRoad;
    cars(:,positionIndex) = newPosition;
    if sum(roadDecision) > 0
        
        routes
    end
    cars(:,roadIndex) = nextRoad.*roadDecision +(1-roadDecision).*currentRoad;
    
end



