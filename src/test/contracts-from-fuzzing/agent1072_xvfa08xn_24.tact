contract MixedSerialization {
    x: Int as uint8;
    y: Int as int64;
    z: Int;

    init() {
        self.x = 255;
        self.y = -64;
        self.z = 123456789;
    }
}