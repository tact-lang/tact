struct ForcesSerializer {
    i8: Int as int8;
    u8: Int as uint8;
    i16: Int as int16;
    u16: Int as uint16;
    i32: Int as int32;
    u32: Int as uint32;
}

contract MixedSerialization {
    field: ForcesSerializer;

    init() {
        self.field = ForcesSerializer{
            i8: -12,
            u8: 250,
            i16: -12345,
            u16: 45678,
            i32: -1234567,
            u32: 3456789
        };
    }
}
