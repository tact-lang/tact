contract IntFieldDefaults {
    x: Int = -5;
    y: Int as uint8 = 255;
    z: Int as int16 = -1024;

    init() {
        self.x = 123;
        self.y = 42;
        self.z = -100;
    }

    receive() {
        self.x += 1;
    }
}