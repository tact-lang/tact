contract SerializeFormats {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint1 = 1;
    d: Int as int16;
    init() {
        self.a = 255;
        self.b = -12345;
        self.c = 1;
        self.d = -123;
    }
}
