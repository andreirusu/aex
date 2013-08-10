package = "aex"

version = "1.0.0-1"

source = {
    url = "git@github.com:andreirusu/aex",
    tag = "1.0.0-1"
}

description = {
    summary = "Experimental Torch code.",
    detailed = [[
        This package contains Andrei's experimental Torch code. 
    ]],
    homepage = "https://github.com/andreirusu/aex",
    license = "BSD"
}



dependencies = {
    "torch >= 7.0",
    "sys >= 1.0"
}

build = {
    type = "builtin",
    modules = {
        aex = "aex/init.lua",
        ["aex.GainNoise"] = "aex/GainNoise.lua",
        ["aex.PoissonGainNoise"] = "aex/PoissonGainNoise.lua",
        ["aex.GaussianGainNoise"] = "aex/GaussianGainNoise.lua"
    }
}

