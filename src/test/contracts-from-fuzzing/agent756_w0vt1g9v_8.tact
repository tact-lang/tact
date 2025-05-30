struct NestedSerializeSizes {
    i8: Int as int8;
    u32: Int as uint32;
    big: Int;
}

contract SerializationEdgeContract {
    dat: NestedSerializeSizes;
    init() {
        self.dat = NestedSerializeSizes{
            i8: -8,
            u32: 123456,
            big: 999999999,
        };
    }
}