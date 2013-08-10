-- The PoissonGainNoise module computes f(x) =  x * N(1, lambda^2)
-- where N the normal distribution. 


require 'torch'
require 'torch-env'
require 'nn'


function randp(lambda)
    local u = torch.rand(1000)
    local p = 1
    local k = 0
    local L = math.exp(-lambda)
    repeat
        k = k + 1
        p = p * u[k]
    until p < L 
    return (k-1)
end


local PoissonGainNoise, parent = torch.class('aex.PoissonGainNoise', 'aex.GainNoise')

function PoissonGainNoise:__init(lambda)
    lambda = lambda or 10
    parent.__init(self)
    self.lambda = lambda
    self.enabled = (lambda > 0)
end

function PoissonGainNoise:setLambda(val)
    self.lambda = val
end

function PoissonGainNoise:updateOutput(input)
    self.scaler = self.lambda 
    if self.enabled then
        self.scaler = randp(self.lambda) 
    end
    self.output:typeAs(input):resizeAs(input):copy(input):mul(self.scaler)
    return self.output
end

function PoissonGainNoise:updateGradInput(input, gradOutput)
    self.gradInput:typeAs(gradOutput):resizeAs(gradOutput):copy(gradOutput):mul(self.scaler)
    return self.gradInput
end

