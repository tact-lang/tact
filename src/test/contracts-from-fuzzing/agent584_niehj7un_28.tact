contract MixedSizeDefaults {
    a: Int as uint8 = 0;
    b: Int as int16 = -1;
    c: Int = 123;

    init() {
        self.a = 1;
        self.b = -2;
        self.c = 456;
    }
}