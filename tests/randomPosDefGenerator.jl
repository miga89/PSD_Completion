workspace()
include("../graph.jl")
include("../tree.jl")
include("../helper.jl")

using GraphModule, TreeModule,Helper, Base.Test

rng = MersenneTwister(123554);

# Define number of test matricesw
nn = 10000

@testset "Test Random Positive Definite Symmetric Matrix Generator" begin

    for iii=1:nn
      dim = rand(rng,2:100,1,1)[1]
      X = generatePosDefMatrix(dim,rng)

      @test isposdef(X) == true
      @test X == X'
    end

end