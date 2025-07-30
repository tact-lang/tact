struct WithSerialization {
    a: Int as int8;
    b: Int as uint64;
    c: Int as int257;
}

contract TestContract {
    w: WithSerialization;

    init() {
        self.w = WithSerialization{
            a: -10,
            b: 1234,
            c: -5555
        };
    }
}