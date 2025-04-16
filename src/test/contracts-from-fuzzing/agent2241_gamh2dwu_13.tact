struct SerializeTest {
    big: Int as int257;
    u4: Int as uint4;
    i8: Int as int8;
    u16: Int as uint16;
    i32: Int as int32;
    u64: Int as uint64;
}

contract SerializationContract {
    ser: SerializeTest;

    init() {
        self.ser = SerializeTest{
            big: 0,
            u4: 15,
            i8: -128,
            u16: 65535,
            i32: -2147483648,
            u64: 18446744073709551615
        };
    }
}