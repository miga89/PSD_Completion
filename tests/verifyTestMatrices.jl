# Test Algorithm to create a superNodeElimTree from a Random Matrix

workspace()
include("../chompack_wrapper.jl")

using Base.Test, chomWrap, JLD

# load test matrices from file
dict = load("completableMatrices.jld")
randomMatrices = dict["randomMatrices"]
numberSaved = dict["numberSaved"]
#testM = [10 4 0 0 0 -4;4 10 -2 -2 0 -2;0 -2 12 8 0 0; 0 -2 8 9 -1 2; 0 0 0 -1 7 -4; -4 -2 0 2 -4 9]

@testset "Test positive semidefinite completion" begin

    for iii=1:numberSaved
        if mod(iii,100) == 0
            println("iii=$(iii)")
        end

        # load test matrix
        A = randomMatrices[iii]

        # create graph from A and make Graph chordal
        W = completeChompack(A)

        @test isposdef(W) == true

    end
end


