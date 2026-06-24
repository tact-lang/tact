contract IntDefaults {
    a: Int = 0;
    b: Int as uint32 = 5;
    c: Int as int64 = -5;
    d: Int as uint8 = 255;

    init() {
        self.a = 42;
        self.b = 1;
        self.c = -1;
        self.d = 0;
    }
}