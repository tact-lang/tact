contract DefaultedFields {
    foo: Int = 42;
    bar: Bool = true;
    baz: String = "hello";

    init() {
        self.foo = 100;
        self.bar = false;
        self.baz = "world";
    }
}