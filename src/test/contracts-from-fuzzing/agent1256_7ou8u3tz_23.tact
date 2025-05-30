struct SizedInts {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int32;
    e: Int as uint64;
}

contract VariedWidths {
    nums: SizedInts;

    init() {
        self.nums = SizedInts{
            a: 15,
            b: -128,
            c: 65535,
            d: -2147483648,
            e: 18446744073709551615,
        };
    }
}