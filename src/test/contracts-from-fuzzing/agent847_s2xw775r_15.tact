struct SerializeInt {
   a: Int as int64;
   b: Int as uint32;
   c: Int as int257;
}

contract SerializationFieldsTest {
    data: SerializeInt;

    init() {
        self.data = SerializeInt{
            a: -5,
            b: 1234,
            c: 12345678901234567890
        };
    }
}