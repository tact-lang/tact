struct PackedInts {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int4;
}

contract IntSerializationTest {
    data: PackedInts;

    init() {
        self.data = PackedInts{
            a: 1,
            b: -2,
            c: 3,
            d: -3
        };
    }
}