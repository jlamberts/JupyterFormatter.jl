using JupyterFormatter
using IJulia
using Test

@testset "UnitTests" begin
    # test that we succesfully add and remove our formatting hook
    starting_hooks = length(IJulia.preexecute_hooks)
    enable_autoformat()
    @test length(IJulia.preexecute_hooks) == starting_hooks + 1
    disable_autoformat()
    @test length(IJulia.preexecute_hooks) == starting_hooks
end
