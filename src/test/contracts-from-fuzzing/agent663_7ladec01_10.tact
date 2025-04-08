struct SmallInts {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
}

contract SizedInts {
    nums: SmallInts;

    init() {
        self.nums = SmallInts{
            a: 255,
            b: -156,
            c: 4294967295,
            d: -5000000000
        };
    }
}