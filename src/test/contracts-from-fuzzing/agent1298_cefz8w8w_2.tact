contract MultiBool {
    foo: Bool;
    bar: Bool = true;
    baz: Bool;

    init() {
        self.foo = false;
        self.baz = true;
    }
}