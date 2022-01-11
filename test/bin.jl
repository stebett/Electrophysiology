# From https://elephant.readthedocs.io/en/latest/reference/conversion.html
function test_same_result_as_elephant()
	spiketrain = [0.5, 0.7, 1.2, 3.1, 4.3, 5.5, 6.7]
	start = 0
	stop = 9
	binsize = 1
    bin(spiketrain, start=start, stop=stop, binsize=binsize) == [2, 1, 0, 1, 1, 1, 1, 0, 0]
end

function test_same_result_as_elephant_2()
	spiketrain = [0.1, 0.7, 1.2, 2.2, 4.3, 5.5, 8.0]
	start = 0
	stop = 9
	binsize = 1
	bin(spiketrain, start=start, stop=stop, binsize=binsize) == [2, 1, 1, 0, 1, 1, 0, 0, 1]
end

# From https://github.com/NeuralEnsemble/elephant/blob/master/elephant/test/test_conversion.py
function test_binarize_with_spiketrain_exact()
	test_array_1d = [0.3, 0.56, 0.87, 1.23]
	times = [0 : 0.01 : 10.0;]
	target = zeros(Bool, length(times))
	for time in test_array_1d
		target[searchsorted(times, time)] .= true
	end
	res = bin(test_array_1d, stop=10.01, binsize=0.01)
	res == target
end

function test_binarize_with_spiketrain_exact_set_ends()
	test_array_1d = [0.3, 0.56, 0.87, 1.23]
	times = [5. : 0.01 : 10.0;]
	target = zeros(Bool, length(times))
	for time in test_array_1d
		target[searchsorted(times, time)] .= true
	end
	res = bin(test_array_1d, start=5., stop=10.01, binsize=0.01)
	res == target
end

@test test_same_result_as_elephant()
@test test_same_result_as_elephant_2()
@test test_binarize_with_spiketrain_exact()
@test test_binarize_with_spiketrain_exact_set_ends()
