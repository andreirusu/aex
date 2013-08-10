-- The GainNoise module computes f(x) =  x * N(1, sigma^2)
-- where N the normal distribution. 


require 'torch'
require 'torch-env'
require 'nn'

local GainNoise, parent = torch.class('aex.GainNoise', 'nn.Module')

function GainNoise:__init()
    parent.__init(self)
    self.enabled = true
end

function GainNoise:setEnabled(val)
    if val == true then 
        self.enabled = false
    else
        self.enabled = false
    end
end

