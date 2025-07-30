contract VarSerialization {
    foo: Int as uint64;
    bar: Int;
    opt: Int?;

    init() {
        self.foo = 42;
        self.bar = -1;
        self.opt = null;
    }
}
