contract Test {
    foo: Int?;
    bar: Int;

    init() {
        self.foo = null;
        self.bar = 42;
    }

    get fun fooVal(): Int? {
        return self.foo;
    }

    get fun barVal(): Int {
        return self.bar;
    }
}