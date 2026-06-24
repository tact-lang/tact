struct ComplexSerial {
    x: Int as uint200;
    y: Int as int150;
    z: Int as int257;
}

contract ComplexSerialTest {
    v: ComplexSerial;

    init() {
        self.v = ComplexSerial{
            x: 123456,
            y: -654321,
            z: 777
        };
    }
}