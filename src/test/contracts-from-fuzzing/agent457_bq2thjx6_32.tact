struct IntOrder {
    a: Int as uint32;
    b: Int as int64;
    c: Int as int257;
}

contract Test {
    ints: IntOrder;
    init() {
        self.ints = IntOrder{ a:42, b: -1, c: 123456789 };
    }
}