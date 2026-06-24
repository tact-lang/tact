contract MixedSerialization {
    x: Int as uint8;
    y: Int as int16;
    z: Int;

    init() {
        self.x = 5;
        self.y = -123;
        self.z = 1000000000;
    }
}