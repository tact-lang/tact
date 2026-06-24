contract TinyBits {
    a: Int as uint1;
    b: Int as int1;
    c: Bool; // should be 1 bit storage

    init() {
        self.a = 1;
        self.b = 0;
        self.c = true;
    }
}