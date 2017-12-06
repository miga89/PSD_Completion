# Test constructors of graph type

workspace()
include("../graph.jl")

using GraphModule, Base.Test

# create random seed (to get reproducable sequence of random numbers)
rng = MersenneTwister(1234);
# Define number of test matrices
nn = 1


     @testset "Test Chordal Extension MCS-M Algorithm" begin

        for iii=1:nn
                if mod(iii,10) == 0
                    println("iii=$(iii)")
                end
                # take random dimension
                dim = rand(rng,2:100,1,1)[1]
                # create random sparse matrix
                A = sprand(rng,50,50,0.1)
                A = A+A'
                # create graph from A
                g = Graph(A)

                # find chordal extension and perfect elimination ordering
                   # println(g)
                    mcsmSearch!(g)
                    @test begin
                        res = isPerfectOrdering(g) == true
                        if !res
                            println(iii)
                            println(g)
                        end
                        res
                    end
        end
     end




