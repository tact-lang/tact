contract SerializationFormats {
    a: Int as uint8;
    b: Int as int64;
    c: Int as coins;
    d: Int as int257;

    init() {
        self.a = 5;
        self.b = -42;
        self.c = 1000;
        self.d = 1234567890;
    }
}