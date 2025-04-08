struct PackedInts {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int32;
    d: Int as uint64;
    e: Int as int128;
}

contract TestContract {
    packed: PackedInts;
    init() {
        self.packed = PackedInts{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5,
        };
    }
}