contract MixedSerializations {
    a: Int as uint8;
    b: Int as int64;
    c: Int as int257;
    d: Int;

    init() {
        self.a = 255;
        self.b = -1000;
        self.c = 123456789;
        self.d = -1;
    }
}