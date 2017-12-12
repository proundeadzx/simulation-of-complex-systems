function [atimeWOS,atime] = getAvreegeTime(savePosition)

    global timeStep;

    nbrCars = size(savePosition,1);
    timeWithoutStop = zeros(1,nbrCars);
    pos = [];
    for i = 1:nbrCars
        pos1 = savePosition(i,:); 
        here = find(savePosition(i,:) ~= 0);
        pos2 = pos1(here(1):here(end));
        pos(1) = pos2(1);
        pos(2) = pos2(2);
        k = 3;
        for j = 1:length(pos2)-2
            if pos(k-2) ~= pos2(j+2)
                pos(k) = pos2(j+2);
                k = k +1;
            end
        end
        timeWithoutStop(i) = length(pos); 
    end
    
    time = zeros(1,nbrCars);
    for i = 1:nbrCars
        here = find(savePosition(i,:) ~= 0);
        time(i) = here(end) - here(1);
    end
    
    
    atimeWOS = timeStep*sum(timeWithoutStop)/nbrCars;
    atime = timeStep*sum(time)/nbrCars;
    
end


