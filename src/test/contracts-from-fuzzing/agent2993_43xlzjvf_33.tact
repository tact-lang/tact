contract ComposeSerials {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int4;
    d: Int as int8;

    init() {
        self.a = 7;
        self.b = 255;
        self.c = -3;
        self.d = -128;
    }
}