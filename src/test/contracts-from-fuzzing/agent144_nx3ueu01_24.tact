contract SerializeIntVariants {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;

    init() {
        self.a = -128;
        self.b = 255;
        self.c = -32000;
        self.d = 123456;
    }
}
