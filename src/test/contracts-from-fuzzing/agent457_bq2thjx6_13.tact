struct WithSerialization {
    a: Int as uint32;
    b: Int as int64;
    c: Int as uint8;
}

contract Test {
    data: WithSerialization;
    init() {
        self.data = WithSerialization{
            a: 42,
            b: -123456789,
            c: 255
        };
    }
}