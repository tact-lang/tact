struct SerializeSizeTest {
    i8: Int as int8;
    u7: Int as uint7;
    i64: Int as int64;
    u30: Int as uint30;
    i257: Int as int257;
}

contract SizeSerialize {
    s: SerializeSizeTest;

    init() {
        self.s = SerializeSizeTest{
            i8: -5,
            u7: 45,
            i64: -1234567890,
            u30: 123456,
            i257: 123456789123456789123456789
        };
    }
}
