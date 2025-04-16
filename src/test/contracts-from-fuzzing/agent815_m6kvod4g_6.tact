contract DefaultOptionals {
    foo: Int?;
    bar: Bool? = false;
    baz: String? = "default";

    init() {
        self.foo = 10;
        self.bar = true;
        self.baz = null;
    }
}