contract Test {
    x: Int;
    y: Int as uint8;
    z: Int as int32;

    init() {
        self.x = 1000;
        self.y = 55;
        self.z = -12345;
    }
}
