contract MultiSerialization {
    a: Int as uint8;
    b: Int;
    c: Int as int32;
    d: Int? as uint16;

    init() {
        self.a = 255;
        self.b = 9999;
        self.c = -1000;
        self.d = 65000;
    }
}
