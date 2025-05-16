contract SerializationVariants {
    a: Int as uint64;
    b: Int as int32;
    c: Int as uint8;
    d: Int;
    e: Int as int257;

    init() {
        self.a = 1;
        self.b = -2;
        self.c = 3;
        self.d = -4;
        self.e = 5;
    }
}