using Electrophysiology
using BenchmarkTools
using Gadfly

a = map(100 : 100 : 100_000) do len
	spiketrain = [1:len;]
	@allocated bin(spiketrain)
end
plot(y=a, Geom.line)
# linear growth

b = map(10 : 100 : 50_000) do binsize
	spiketrain = [1:100_000;]
	@allocated bin(spiketrain, binsize=binsize)
end
plot(y=b, Geom.line)
# exponenatial decay

spiketrain = [1:100_000;];
@code_warntype bin(spiketrain)
# type stable

@btime bin(spiketrain)
# reasonably fast
