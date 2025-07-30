struct FixedSize {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
}

contract TestContract {
    val: FixedSize;

    init() {
        self.val = FixedSize {
            a: 5,
            b: -1234,
            c: 123456,
            d: -12345678,
        };
    }
}