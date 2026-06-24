struct IntStruct {
    i8: Int as int8;
    u8: Int as uint8;
    i16: Int as int16;
    u16: Int as uint16;
    i32: Int as int32;
    u32: Int as uint32;
}

contract Test {
    s: IntStruct;
    init() {
        self.s = IntStruct{
            i8: -12,
            u8: 250,
            i16: -32000,
            u16: 65000,
            i32: -2000000000,
            u32: 4000000000
        };
    }
}