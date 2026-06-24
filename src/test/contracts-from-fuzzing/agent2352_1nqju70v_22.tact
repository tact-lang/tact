contract SerializationAnnotations {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint32;
    d: Int;
    e: Int as coins;

    init() {
        self.a = 255;
        self.b = -100;
        self.c = 123456;
        self.d = -1;
        self.e = 1000000000;
    }
}