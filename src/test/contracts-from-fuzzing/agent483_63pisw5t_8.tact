struct IntSerial {
    x: Int as uint4;
    y: Int as int16;
    z: Int;
}

contract SerialTest {
    num: IntSerial;

    init() {
        self.num = IntSerial{
            x: 7,
            y: -1000,
            z: 123456789,
        };
    }
}
