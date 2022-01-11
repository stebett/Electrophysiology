import StatsBase

"""
	bin(x::AbstractVector; [start=0., stop=last(x), binsize=1.0])::Vector{Float64}

Bins an input vector. The bin ranges corresponds to `start:binsize:stop`, where the upper value not included. 

# Example 
```julia-repl
julia> bin([0, 1, 1.5], binsize=0.5) # the bins are [0, 0.5), [0.5, 1), [1, 1.5)
3-element Vector{Float64}
 1.0
 0.0
 1.0

julia> bin([0, 0.7, 1.3], stop=1.5, binsize=0.5)
3-element Vector{Float64}
 1.0
 1.0
 1.0
```
"""
@inline function bin(x::AbstractVector; start::Number=0., stop::Number=last(x), binsize::Number=1.)
	bin(float.(x), float(start), float(stop), float(binsize))
end

@inline function bin(x::AbstractVector{T}, start::T, stop::T, binsize::T)::Vector{T} where {T <: Float64}
	StatsBase.fit(StatsBase.Histogram, x, start:binsize:stop).weights
end
