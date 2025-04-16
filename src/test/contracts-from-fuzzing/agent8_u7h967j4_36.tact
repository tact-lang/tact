contract DefaultInContract {
    foo: Int = 10;
    bar: Bool? = null;
    baz: String? = null;

    init() {
        self.foo = 42;
        self.bar = true;
        self.baz = "hello";
    }
}