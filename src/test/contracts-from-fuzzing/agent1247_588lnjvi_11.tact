struct SerializeTest {
    i8: Int as int8;
    u16: Int as uint16;
    i257: Int as int257;
}

contract SerializationLimits {
    data: SerializeTest;

    init() {
        self.data = SerializeTest{
            i8: -100,
            u16: 65535,
            i257: -2
        };
    }
}