struct SerializeTest {
    i8: Int as int8;
    ui8: Int as uint8;
    i16: Int as int16;
    ui16: Int as uint16;
    i32: Int as int32;
    ui32: Int as uint32;
    i64: Int as int64;
    ui64: Int as uint64;
}

contract SerializeContract {
    data: SerializeTest;

    init() {
        self.data = SerializeTest{
            i8: -128,
            ui8: 255,
            i16: -32768,
            ui16: 65535,
            i32: -2147483648,
            ui32: 4294967295,
            i64: -9223372036854775808,
            ui64: 18446744073709551615,
        };
    }
}