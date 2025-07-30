struct SerialOrderTest {
    x: Int as int8;
    y: Int as uint64;
    z: Int as int257;
}

contract SerializationOrder {
    s: SerialOrderTest;

    init() {
        self.s = SerialOrderTest{x: -5, y: 1234567890, z: -999};
    }
}
