contract SerializationVariants {
    a: Int as uint8;
    b: Int as int16;
    c: Int as coins;

    init() {
        self.a = 1;
        self.b = -5;
        self.c = 1000000;
    }
}