spiketrain = [1:100;]
landmark = 50
offset1 = -10
offset2 = 10
@test cut(spiketrain, landmark, offset1, offset2) == [0:20;]
@test typeof(cut(spiketrain, landmark, offset1, offset2)) == typeof(spiketrain)

spiketrain = [1.0:100.0;]
landmark = 50.0
offset1 = -10.0
offset2 = 10.0
@test cut(spiketrain, landmark, offset1, offset2) == [0.0:20.0;]
@test typeof(cut(spiketrain, landmark, offset1, offset2)) == typeof(spiketrain)

spiketrain = [1:100;]
landmark = 50
offset1 = 0
offset2 = 0
@test cut(spiketrain, landmark, offset1, offset2) == [0]

spiketrain = [1:100;]
landmark = 50
offset1 = 10
offset2 = -10
@test cut(spiketrain, landmark, offset1, offset2) == []

spiketrain = [1:100;]
landmark = 50
offset1 = -50
offset2 = 60
@test cut(spiketrain, landmark, offset1, offset2) == [1:100;]

spiketrain = [1:100;]
landmark = 50
offset1 = -50
offset2 = 1000
@test cut(spiketrain, landmark, offset1, offset2) == [1:100;]

spiketrain = [1:100;]
landmark = 50
offset1 = -60
offset2 = 1000
@test cut(spiketrain, landmark, offset1, offset2) == [11:110;]
