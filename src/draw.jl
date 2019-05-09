using PyPlot

#=draw lines from the center of each hyperedges to each vertex
params: h: Hypergraph
        locs_x: x location of vertexs
        locs_y: y location of vertexs
        clocs_x: center x location of hyperedges
        clocs_y: center y location of hyperedges
=#
function dextranode(h::Hypergraph,locs_x, locs_y, clocs_x, clocs_y)
    n_ver,n_he=size(h) #numbero of vertices and hyperedges
        plt.scatter(locs_x,locs_y, s=18^2, zorder=2) #scatter the points
        for i in 1:n_ver
            plt.annotate(i, (locs_x[i]-0.025,locs_y[i]-0.025), color="white")
        end
        for x in 1:n_he
            pos=[]
            for y in 1:n_ver
                if getindex(h,y,x)!=nothing
                    push!(pos,y)
                end
            end
            lineX=[]
            lineY=[]
            for j in 1:length(pos)
                push!(lineX,clocs_x[x])
                push!(lineX,locs_x[pos[j]])
                push!(lineY,clocs_y[x])
                push!(lineY,locs_y[pos[j]])
            end
            plt.plot(lineX,lineY, zorder=1)
        end
        ax= plt.gca()
        plt.xticks([])
        plt.yticks([])
        gcf()
end

#=draw the Hypergraph using the eulero_venn visualization
params: H: Hypergraph
        locs_x: x location of vertexs
        locs_y: y location of vertexs

=#
function deulero_venn(h::Hypergraph, loc_x, loc_y)
    n_ver,n_he=size(h) #num vertices and hyperedges
    plt.scatter(loc_x,loc_y,s=18^2,zorder=2)
    for i in 1:n_ver
        plt.annotate(i, (loc_x[i]-0.025,loc_y[i]-0.025))
    end
    x=1
    for x in x:n_he
        pos=[]
        y=1
        for y in y:n_ver
            if getindex(h,y,x)!=nothing
                push!(pos,y)
            end
        end
        if length(pos)!=0   #check if there aren't any empty hyperedges
            lineX=[]
            lineY=[]
            for j in 1:length(pos)
                push!(lineX,loc_x[pos[j]])
                push!(lineY,loc_y[pos[j]])
            end
            push!(lineX,loc_x[pos[1]])
            push!(lineY,loc_y[pos[1]])
            if length(pos)==1
                plt.scatter(loc_x[pos[1]],loc_y[pos[1]],marker="o",facecolors="none",s=1000, edgecolors=[rand() rand() rand()])
            elseif length(pos)==2
                plt.plot(lineX,lineY,zorder=1,linewidth=5)
            else
                plt.plot(lineX,lineY,zorder=1,linewidth=0)
                plt.fill_between(lineX,lineY, alpha=0.3)
            end
        end
    end
    gcf()
end

#close the current figure
function chgplot()
    close()
end
