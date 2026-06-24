struct OptBoolInt {
    f1: Bool?;            f2: Bool?;            f3: Bool?;
    i1: Int? as uint4;    i2: Int? as uint4;    i3: Int? as uint8;
    j: Int;
}

contract OptionalBoolIntSizes {
    s: OptBoolInt;

    init() {
        self.s = OptBoolInt{
            f1: null,
            f2: null,
            f3: null,
            i1: null,
            i2: null,
            i3: null,
            j: 42
        };
    }
}
