struct NarrowBits {
    a: Int as int1;
    b: Int as uint3;
    c: Int as uint8;
    d: Int as int16;
    e: Int as uint256;
    f: Bool;
    g: Bool?;
}

contract NarrowBitsTest {
    data: NarrowBits;

    init() {
        self.data = NarrowBits{
            a: 0,
            b: 7,
            c: 255,
            d: 12345,
            e: 123456789012345678901234567890,
            f: true,
            g: null
        };
    }
}