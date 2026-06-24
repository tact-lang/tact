struct DifferentInts {
    big: Int;               // default 257-bit
    small: Int as int8;     // 8-bit signed
    medium: Int as uint64;  // 64-bit unsigned
    tiny: Int as uint4;     // 4-bit unsigned
}

contract VariousSerializedInts {
    s: DifferentInts;

    init() {
        self.s = DifferentInts{
            big: 123456789,
            small: -5,
            medium: 987654321,
            tiny: 9,
        };
    }
}