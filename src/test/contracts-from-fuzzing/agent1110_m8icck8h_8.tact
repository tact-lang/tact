contract TestContract {
    a: Int as uint4;          // 4 bits unsigned
    b: Int as int8;           // 8 bits signed
    c: Int as coins;          // coin type serialization
    d: Int as uint64;         // 64 bits unsigned
    e: Bool;                  // 1 bit bool

    init() {
        self.a = 7;
        self.b = -5;
        self.c = 12345;
        self.d = 123456789;
        self.e = true;
    }
}