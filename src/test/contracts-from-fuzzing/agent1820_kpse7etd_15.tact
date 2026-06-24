contract SerializeTest {
    x: Int as uint8;
    y: Int as int64;
    z: Int as uint256;
    init() {
        self.x = 5;
        self.y = -20;
        self.z = 1000000;
    }
}