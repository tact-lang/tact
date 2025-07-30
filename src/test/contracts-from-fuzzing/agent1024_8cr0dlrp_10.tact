contract MixedSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
    d: Int as int257;
    e: Bool;
    f: Bool;

    init() {
        self.a = 255;
        self.b = -32768;
        self.c = 123456789;
        self.d = -1;
        self.e = true;
        self.f = false;
    }
}