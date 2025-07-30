struct PackedNumbers {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int32;
    e: Int as uint64;
}

contract SerializationTest {
    packed: PackedNumbers;

    init() {
        self.packed = PackedNumbers{
            a: 9,
            b: -12,
            c: 1000,
            d: -90000,
            e: 1234567890
        };
    }
}