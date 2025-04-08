contract Test {
    x: Int = 0;
    y: Int as uint8;
    z: Int as int128;

    init() {
        self.y = 255;
        self.z = -100;
    }
}