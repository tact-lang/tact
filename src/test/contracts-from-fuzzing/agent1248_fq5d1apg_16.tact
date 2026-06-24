struct Inner {
    one: Int as int64;
    two: Int as uint32;
    three: Int as int8;
}

contract SerializationMix {
    i: Inner;

    init() {
        self.i = Inner{one:1,two:2,three:3};
    }
}
