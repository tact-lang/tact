struct SerialTest {
    i8: Int as int8;
    u8: Int as uint8;
    i16: Int as int16;
    u16: Int as uint16;
    i32: Int as int32;
    u32: Int as uint32;
}

contract SerializationFormats {
    s: SerialTest;

    init() {
        self.s = SerialTest{
            i8: -8, u8: 8, i16: -16, u16: 16, i32: -32, u32: 32
        };
    }
}