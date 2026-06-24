struct WithSerialization {
    a: Int as int64;
    b: Int as uint8;
    c: Bool;
}

contract TestContract {
    s: WithSerialization;

    init() {
        self.s = WithSerialization{ a: 1234567890, b: 255, c: true };
    }
}