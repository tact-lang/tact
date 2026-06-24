contract SerializationPrimitives {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
    d: Int as coins;

    init() {
        self.a = 5;
        self.b = -100;
        self.c = 123456;
        self.d = 7890;
    }
}