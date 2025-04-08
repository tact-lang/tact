struct MixSerializations {
    i1: Int as uint8;
    i2: Int as int16;
    i3: Int as uint32;
    i4: Int;
    b1: Bool;
    s1: String;
}

contract TestMixSer {
    data: MixSerializations;

    init() {
        self.data = MixSerializations{
            i1: 1,
            i2: -2,
            i3: 3,
            i4: 4,
            b1: true,
            s1: "hello",
        };
    }
}
