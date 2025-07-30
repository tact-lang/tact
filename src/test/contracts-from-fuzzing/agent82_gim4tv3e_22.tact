contract SerializeCheck {
    a: Int as int4;
    b: Int as uint8;
    c: Int as int16;

    init() {
        self.a = -7;
        self.b = 255;
        self.c = -32768;
    }
}
