struct ManyNumbers {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as uint64;
    e: Int as uint128;
    f: Int as int8;
    g: Int as int16;
    h: Int as int32;
    i: Int as int64;
    j: Int as int128;
}

contract Test {
    nums: ManyNumbers;

    init() {
        self.nums = ManyNumbers{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5,
            f: -1,
            g: -2,
            h: -3,
            i: -4,
            j: -5,
        };
    }
}