contract SerializeMix {
    foo: Int as uint1;    // 1 bit
    bar: Int as uint64;  // 64 bits
    baz: Int as int257;  // 257 bits (full)

    init() {
        self.foo = 1;
        self.bar = 2;
        self.baz = 3;
    }
}
