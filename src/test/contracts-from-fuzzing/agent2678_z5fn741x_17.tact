struct Small {
    i: Int as uint4;
    j: Int as int3;
}

contract SmallSerialized {
    data: Small;

    init() {
        self.data = Small{
            i: 7,
            j: -3
        };
    }
}