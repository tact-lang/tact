contract Test {
    foo: Int as int4; // 4-bit signed int
    bar: Int as uint4; // 4-bit unsigned int
    init() {
        self.foo = 7;
        self.bar = 15;
    }
}