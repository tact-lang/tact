contract IntTypeSizes {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int16;
    d: Int as int32;
    e: Int;

    init() {
        self.a = 255;
        self.b = 65535;
        self.c = -32768;
        self.d = 2147483647;
        self.e = -1;
    }
}