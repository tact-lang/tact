struct WithSerialization {
    a: Int as uint8;
    b: Bool;
    c: Int as int16;
    d: Bool;
    e: Int as uint32;
    f: Bool;
}

contract TestContract {
    data: WithSerialization;

    init() {
        self.data = WithSerialization{
            a: 250,
            b: true,
            c: -300,
            d: false,
            e: 100000,
            f: true,
        };
    }
}