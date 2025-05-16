contract BoolIntDefaults {
    foo: Bool = true;
    bar: Int = 100;
    baz: Bool;
    qux: Int;

    init() {
        self.baz = false;
        self.qux = 200;
    }

    receive() {
        self.foo = false;
        self.bar = 101;
    }
}