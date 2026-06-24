contract DeepManySerialization {
    foo: Int as uint8;
    bar: Int as int128;
    baz: Int as int64;
    big: Int as int256;
    small: Int as uint1;
    mid: Int as uint32;

    init() {
        self.foo = 1;
        self.bar = -50;
        self.baz = -1234567890;
        self.big = 999999999999;
        self.small = 1;
        self.mid = 42;
    }
}