struct WithSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int257;
}

contract SerializedFields {
    s: WithSerialization;
    init() {
        self.s = WithSerialization{
            a: 1,
            b: 2,
            c: 3,
            d: 4
        };
    }
}