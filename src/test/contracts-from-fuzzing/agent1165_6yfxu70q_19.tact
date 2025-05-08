struct PackedInts {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int32;
    d: Int as uint64;
}

contract SerializationMix {
    packed: PackedInts;

    init() {
        self.packed = PackedInts{ a: 1, b: 2, c: -3, d: 4 };
    }
}
