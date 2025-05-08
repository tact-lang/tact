contract SerializeFields {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int16;
    e: Int as uint32;
    f: Int as int32;

    init() {
        self.a = 255;
        self.b = -128;
        self.c = 65535;
        self.d = -32768;
        self.e = 4294967295;
        self.f = -2147483648;
    }
}