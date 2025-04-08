contract MixedSerialization {
    x: Int as uint8;
    y: Int as int32;
    z: Int;

    init() {
        self.x = 255;
        self.y = -100000;
        self.z = 42;
    }
}
