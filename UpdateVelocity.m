function newVelocity = uppdateVelocity(oldVelocity,acceleration)
    % Uppdate velocity
    deltaT = 0.1;
    newVelocity = oldVelocity + deltaT*acceleration;
     
end