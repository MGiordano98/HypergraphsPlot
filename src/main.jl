using PyPlot

#including HypergraphsPlot
hgplt= include("HypergraphsPlot.jl")

h= hgplt.generatehg() #generate a random hypergraph with 10 vertices (default) and 5 hyperedges (default)

hgplt.chgplot() #to plot a new hypergraph u need to close the current figure using plt.chgplot()

hgplt.hgplot(h) #plot h using the spring_layout (default) and extra_node visualization (default)

savefig("figure.png") #save the current figure