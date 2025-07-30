struct DefaultsSerialization {
    a: Int as uint8 = 255;
    b: Int as int16 = -32768;
    c: Int as uint16 = 65535;
}

contract SerializedDefaultsTest {
    data: DefaultsSerialization;

    init() {
        self.data = DefaultsSerialization{};
    }
}