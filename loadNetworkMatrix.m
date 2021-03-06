function networkMatrix = loadNetworkMatrix(roads,nodes)

    networkMatrix = zeros(length(nodes),length(nodes));
    
    for i = 1:length(roads)
        from = roads(i,1);
        to = roads(i,2);
        roadLength = norm(nodes(to,:) - nodes(from,:));
        networkMatrix(from,to) = roadLength;
    end
                    
end