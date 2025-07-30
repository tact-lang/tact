contract MultipleOptionals {
    foo: Int?;
    bar: Int?;
    baz: Int?;
    opt: String?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = 5;
        self.opt = null;
    }
}