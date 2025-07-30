struct SerFormats {
    i8: Int as int8;
    u8: Int as uint8;
    i16: Int as int16;
    u16: Int as uint16;
    i64: Int as int64;
    u64: Int as uint64;
}

contract SerializationFormatsContract {
    f: SerFormats;
    init() {
        self.f = SerFormats{ i8: 1, u8: 2, i16: 3, u16: 4, i64: 5, u64: 6 };
    }
}