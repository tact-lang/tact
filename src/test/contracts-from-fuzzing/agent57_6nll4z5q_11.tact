contract AnnotSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;

    init() {
        self.a = 255;
        self.b = -12345;
        self.c = 4294967295;
        self.d = -987654321;
    }
}