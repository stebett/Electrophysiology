# Responsibilities of the library

- Transformations
	- Alignment (of spiketrains)
	- Cutting 
	- Binning
	- Convoluting
	- Density
	- Shuffling
	- Normalization functions (demean, z-score, MAD, etc)
	- Filters
	- Hann Smoothing

- Analyses
	- PSTH / JPSTH / MultiPSTH
	- Cross-correlation
	- Auto-correlation
	- Coefficient of variation
	- Spike triggered average
	- Continuous wavelet transform
	- Analyises of frequency
	- isi 


- Statistics (maybe this can be handled externally from HypothesisTests.jl, we could even extend that library if we need something)
	- Anova
	- Winsor
	- Generic tests 

- Plotting recipes
	- Choose a library


# Non-responsibilities of the library

- Loading of data
- Comprehensive data structure (like Neo)
- Clustering, Model fitting, or anything better handled from other libraries

# General structure

- Input types
	- Spiketrain
	- LFP?
	- DiscreteEvent
	- ContinousEvent
	- more

- Analyses types
	- A type for each analysis
	- compute(AnalysisType, args) to compute
	- plot(AnalysisType, args) to plot

# Important points

- Documentation
- Extensibility
- Testing

# Tips

- Avoid too many dependencies for faster precompilation
