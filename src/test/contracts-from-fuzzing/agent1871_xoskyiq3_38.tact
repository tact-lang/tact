contract ShortDefaults {
    a: Int as uint8 = 1;
    b: Int as int8 = -1;
    c: Int = 0;

    init() {
        self.a = 2;
        self.b = -2;
        self.c = 3;
    }
}