struct Numbers {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as int128;
}

contract NumTypes {
    nums: Numbers;

    init() {
        self.nums = Numbers{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5
        };
    }
}