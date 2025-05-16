struct IntSerial {
    i1: Int as uint8;
    i2: Int as int16;
    i3: Int as uint32;
    i4: Int as int257;
}

contract SerializationTest {
    data: IntSerial;

    init() {
        self.data = IntSerial{
            i1: 255,
            i2: -32768,
            i3: 4294967295,
            i4: -1,
        };
    }

    receive() {}
}
