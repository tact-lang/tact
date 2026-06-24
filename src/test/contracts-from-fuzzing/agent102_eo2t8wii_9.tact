contract FixedSerializationTest {
    x: Int as uint8;
    y: Int as int64;
    z: Int as uint256;

    init() {
        self.x = 42;
        self.y = -12345;
        self.z = 999;
    }
}