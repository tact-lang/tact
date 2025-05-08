struct WithSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
}

contract StorageSerialization {
    data: WithSerialization;
    init() {
        self.data = WithSerialization{
            a: 1,
            b: -20,
            c: 300000,
            d: -50000
        };
    }
}