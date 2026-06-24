contract TestContract {
    foo: Int as coins;     // variable bit-width
    bar: Int as uint64;   // fixed 64 bits
    baz: Int as int128;   // fixed 128 bits
    opt: Int?;
    init() {
        self.foo = 1;
        self.bar = 2;
        self.baz = 3;
        self.opt = null;
    }
}