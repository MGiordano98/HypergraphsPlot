using PyPlot

#=draw lines from the center of each hyperedges to each vertex
params: h: Hypergraph
        locs_x: x location of vertexs
        locs_y: y location of vertexs
        clocs_x: center x location of hyperedges
        clocs_y: center y location of hyperedges
=#
function dextranode(h::Hypergraph,locs_x, locs_y, clocs_x, clocs_y)
    
end

#=draw the Hypergraph using the eulero_venn visualization
params: H: Hypergraph
        locs_x: x location of vertexs
        locs_y: y location of vertexs

=#
function deulero_venn(h::Hypergraph, loc_x, loc_y)
    
end

#close the current figure
function chgplot()
    close()
end