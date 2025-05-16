struct OptSerial {
    a: Int? as uint8;
}

contract OptSerialTest {
    data: OptSerial;
    init() {
        self.data = OptSerial{ a: null };
    }
}