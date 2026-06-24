struct DefaultSerial {
    a: Int as uint8 = 5;
    b: Int as int16 = -23;
    c: Int as uint4 = 7;
}

contract SerialDefaultsTest {
    param: DefaultSerial;

    init() {
        self.param = DefaultSerial{};
    }
}