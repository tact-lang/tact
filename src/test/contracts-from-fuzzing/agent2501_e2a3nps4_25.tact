contract SerializationDefaults {
    a: Int as uint8 = 1;
    b: Int as int16 = -7;
    c: Int as coins = 12345;

    init() {
        self.a = 1;
        self.b = -7;
        self.c = 12345;
    }
}