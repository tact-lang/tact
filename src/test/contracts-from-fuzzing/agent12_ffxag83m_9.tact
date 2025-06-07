struct Compact {
    a: Int as int64;
    b: Int as uint8;
    c: Int as uint256;
    d: Int as int1;
}

contract SerializeTest {
    data: Compact;

    init() {
        self.data = Compact{
            a: 42,
            b: 255,
            c: 123456,
            d: 1
        };
    }
}
