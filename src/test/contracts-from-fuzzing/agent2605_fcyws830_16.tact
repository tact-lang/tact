struct SerializeSizes {
    i8: Int as int8;
    u8: Int as uint8;
    i16: Int as int16;
    u16: Int as uint16;
    i32: Int as int32;
    u32: Int as uint32;
}

contract SerialWidths {
    data: SerializeSizes;

    init() {
        self.data = SerializeSizes{
            i8: -128,
            u8: 255,
            i16: -32768,
            u16: 65535,
            i32: -2147483648,
            u32: 4294967295,
        };
    }
}
