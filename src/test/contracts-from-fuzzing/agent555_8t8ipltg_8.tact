struct Inner {
    smallValue: Int as uint4;
}

contract SerializationEdge {
    tiny: Inner;

    init() {
        self.tiny = Inner{
            smallValue: 10
        };
    }
}