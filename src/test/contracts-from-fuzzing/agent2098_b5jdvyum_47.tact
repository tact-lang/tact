contract ImplicitZeroDefaults {
    a: Int;
    b: Int as uint8;
    c: Int as int16;

    init() {
        self.a = 0;
        self.b = 0;
        self.c = 0;
    }
}
