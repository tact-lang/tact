contract SerializationMix {
    a: Int as int32;
    b: Int as uint64;
    c: Int;

    init() {
        self.a = -15;
        self.b = 10000000;
        self.c = 42;
    }
}