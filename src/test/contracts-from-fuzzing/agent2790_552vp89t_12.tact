struct SerialFormats {
    i64: Int as int64;
    u32: Int as uint32;
    i8: Int as int8;
    u1: Int as uint1;
    big: Int as int257;
}

contract Test {
    data: SerialFormats;

    init() {
        self.data = SerialFormats{
            i64: 1,
            u32: 2,
            i8: 3,
            u1: 1,
            big: 9999
        };
    }
}