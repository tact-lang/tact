struct Serialized {
    u8: Int as uint8;
    u16: Int as uint16;
    i64: Int as int64;
    big: Int as int257;
}

contract Test {
    data: Serialized;

    init() {
        self.data = Serialized{
            u8: 1,
            u16: 2,
            i64: 3,
            big: 4
        };
    }
}
