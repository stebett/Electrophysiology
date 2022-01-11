"Extract part of the spiketrain between 2 offsets from a landmark, aligning at the beginning of the cut"
@views @inline function cut(spiketrain::AbstractVector, landmark::Number, offset1::Number, offset2::Number)
	@. spiketrain[landmark + offset1 <= spiketrain <= landmark + offset2] - (landmark + offset1)
end
