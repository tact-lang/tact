struct Compressed {
    a: Int as uint8;
    b: Int as uint64;
    c: Int as int4;
    d: Int as uint256;
    e: Int as int1;
}

contract CompressionCheck {
    data: Compressed;

    init() {
        self.data = Compressed{
            a: 1,
            b: 1000000,
            c: -2,
            d: 123456789,
            e: 1
        };
    }
}