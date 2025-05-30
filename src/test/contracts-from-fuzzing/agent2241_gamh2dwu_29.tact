struct IntSerialization {
    big: Int as int257;
    u8: Int as uint8;
}

contract SerializeFields {
    v: IntSerialization;

    init() {
        self.v = IntSerialization{
            big: 123456,
            u8: 255
        };
    }
}