-- The GaussianGainNoise module computes f(x) =  x * N(1, sigma^2)
-- where N the normal distribution. 


require 'torch'
require 'torch-env'
require 'nn'

local GaussianGainNoise, parent = torch.class('aex.GaussianGainNoise', 'aex.GainNoise')

function GaussianGainNoise:__init(sigma)
    sigma = sigma or 0
    parent.__init(self)
    self.sigma = sigma
    self.enabled = (sigma > 0)
end

function GaussianGainNoise:setSigma(val)
    self.sigma = val
end

function GaussianGainNoise:updateOutput(input)
    self.scaler = self.sigma 
    if self.enabled then
        self.scaler = self.scaler + self.sigma * torch.randn(1)[1]
    end
    self.output:typeAs(input):resizeAs(input):copy(input):mul(self.scaler)
    return self.output
end

function GaussianGainNoise:updateGradInput(input, gradOutput)
    self.gradInput:typeAs(gradOutput):resizeAs(gradOutput):copy(gradOutput):mul(self.scaler)
    return self.gradInput
end

