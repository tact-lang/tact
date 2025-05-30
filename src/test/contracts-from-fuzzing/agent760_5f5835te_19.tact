struct Packed {
    u4: Int as uint4;
    i8: Int as int8;
    u16: Int as uint16;
    i32: Int as int32;
}

contract PackedFields {
    packed: Packed = Packed{
        u4: 5,
        i8: -10,
        u16: 1000,
        i32: -2000,
    };

    init() {
        self.packed = Packed{
            u4: 4,
            i8: 8,
            u16: 65000,
            i32: -1,
        };
    }
}