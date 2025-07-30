contract IntOverflow {
    foo: Int as int4 = 0;
    init() {
        self.foo = 15;
    }
}