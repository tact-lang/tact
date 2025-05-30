struct IntSizes {
    a: Int as int1;
    b: Int as int8;
    c: Int as int64;
    d: Int as uint4;
    e: Int as uint32;
    f: Int as uint256;
}

contract BitWidthTest {
    bits: IntSizes;
    init() {
        self.bits = IntSizes{
            a: 0,
            b: -12,
            c: 123456789,
            d: 10,
            e: 999999,
            f: 123456789123456789123456789,
        };
    }
}