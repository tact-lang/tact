// Mix of int serialization sizes
struct MixedInts {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;
    e: Int as int64;
}

contract StorageTest {
    mixed: MixedInts;

    init() {
        self.mixed = MixedInts{
            a: 5,
            b: 10,
            c: -20,
            d: 10000,
            e: -50000
        };
    }
}