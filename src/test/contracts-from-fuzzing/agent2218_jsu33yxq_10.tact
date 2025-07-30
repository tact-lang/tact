struct IntVariants {
    a: Int as int64;
    b: Int as uint64;
    c: Int as int257;
    d: Int as uint256;
}

contract Test {
    data: IntVariants;

    init() {
        self.data = IntVariants{
            a: -42,
            b: 42,
            c: -1000000,
            d: 1000000
        };
    }
}