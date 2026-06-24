struct PackedInts {
    one: Int as uint1;
    eight: Int as uint8;
    sixteen: Int as uint16;
    thirtytwo: Int as uint32;
}

contract SerializedInts {
    data: PackedInts;
    init() {
        self.data = PackedInts{
            one: 1,
            eight: 255,
            sixteen: 65535,
            thirtytwo: 4294967295
        };
    }
}