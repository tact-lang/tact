contract IntConsts {
    foo: Int = 5 + 9;
    bar: Int as uint32 = 2 * 3;

    init() {
        self.foo = 100;
        self.bar = 200;
    }
}