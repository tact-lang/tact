contract UintSerializeMax {
    a: Int as uint8;
    b: Int as uint16;

    init() {
        self.a = 255;
        self.b = 65535;
    }
}