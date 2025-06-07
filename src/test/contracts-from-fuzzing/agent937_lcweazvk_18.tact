struct StringInts {
    s: String;
    i1: Int;
    i2: Int as uint32;
    i3: Int as int8;
}

contract StringAndInts {
    data: StringInts;

    init() {
        self.data = StringInts{
            s: "abc",
            i1: 1000000,
            i2: 4294967295,
            i3: -128
        };
    }
}