contract DifferentSerializations {
    a: Int as uint8;
    b: Int as int64;
    c: Int; // default int257

    init() {
        self.a = 255;
        self.b = -5000000;
        self.c = 123456789;
    }
}