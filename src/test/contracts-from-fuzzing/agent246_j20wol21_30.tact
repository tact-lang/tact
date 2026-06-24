contract SerialDefaults {
    a: Int as uint8 = 1;
    b: Int as int16 = -100;

    init() {
        self.a = 255;
        self.b = 30000;
    }
}