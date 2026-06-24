contract IntDefaults {
    a: Int = 5;
    b: Int = -7;
    c: Int as uint32 = 123;
    d: Int as int16 = -30000;
    init() {
        self.a = 10;
        self.b = -14;
        self.c = 456;
        self.d = -12345;
    }
}