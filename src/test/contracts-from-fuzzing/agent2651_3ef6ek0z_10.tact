struct FixedSizeInts {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int32;
    d: Int as uint64;
    e: Int as int128;
}

contract FixedSizeIntsContract {
    values: FixedSizeInts;

    init() {
        self.values = FixedSizeInts{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5,
        };
    }
}