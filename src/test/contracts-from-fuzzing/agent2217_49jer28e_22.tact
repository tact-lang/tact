struct Packed {
    i1: Int as uint8;
    i2: Int as int16;
    i3: Int as uint4;
    i4: Int; // default 257 bit
}

contract PackedStorage {
    data: Packed;
    init() {
        self.data = Packed{
            i1: 255,
            i2: -32768,
            i3: 15,
            i4: 123456789
        };
    }
}
