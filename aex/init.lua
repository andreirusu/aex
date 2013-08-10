require 'torch'
require 'sys'

aex={}

-- new Modules:
torch.include('aex', 'GainNoise.lua')
torch.include('aex', 'PoissonGainNoise.lua')
torch.include('aex', 'GaussianGainNoise.lua')




