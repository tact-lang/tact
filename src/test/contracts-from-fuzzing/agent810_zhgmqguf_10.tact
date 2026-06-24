struct WithSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int as int257;
    d: Int; // default is Int as int257
}

contract TestContract {
    data: WithSerialization;
    init() {
        self.data = WithSerialization{
            a: 1,
            b: -2,
            c: 3,
            d: 4,
        };
    }
}