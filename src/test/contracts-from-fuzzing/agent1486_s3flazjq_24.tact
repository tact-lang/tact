contract SerializationMix {
    a: Int as int64;
    b: Int;
    c: Int as uint32;
    d: Int as uint16;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
    }
}
