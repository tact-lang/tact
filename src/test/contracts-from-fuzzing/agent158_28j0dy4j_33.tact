struct MultiSerialization {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int32;
    e: Int as uint64;
}

contract MixedSerializedStruct {
    s: MultiSerialization;
    init() {
        self.s = MultiSerialization{
            a: 10,
            b: -50,
            c: 12345,
            d: -12345678,
            e: 987654321
        };
    }
}