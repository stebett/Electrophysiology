using Electrophysiology
using BenchmarkTools
using Gadfly

a = map(100 : 100 : 100_000) do len
	spiketrain = [1:len;]
	landmark = 50
	offset1 = -10
	offset2 = 10
	@allocated cut(spiketrain, landmark, offset1, offset2)
end
plot(y=a, Geom.line)
# linear growth


b = map(10 : 100 : 50_000) do offset
	spiketrain = [1:100_000;]
	landmark = 50_000
	offset1 = -offset
	offset2 = offset
	@allocated cut(spiketrain, landmark, offset1, offset2)
end
plot(y=b, Geom.line)
# linear growth

spiketrain = [1:100_000;];
landmark = 50_000;
offset1 = -1000;
offset2 = 1000;
@btime cut(spiketrain, landmark, offset1, offset2);
# reasonably fast

@code_warntype cut(spiketrain, landmark, offset1, offset2);
# type stable
