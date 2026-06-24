struct SerSizes {
    i64: Int as int64;
    u32: Int as uint32;
    u8: Int as uint8;
}

contract SerializedVars {
    f: SerSizes;

    init() {
        self.f = SerSizes{
            i64: -123,
            u32: 65536,
            u8: 255,
        };
    }
}