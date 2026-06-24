contract MixedSerial {
    a: Int as uint32;
    b: Bool;
    c: Int as int64;
    d: Bool?;
    e: Int? as uint8;

    init() {
        self.a = 1;
        self.b = true;
        self.c = -123;
        self.d = null;
        self.e = 255;
    }
}