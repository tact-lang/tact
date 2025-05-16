contract DefaultOptional {
    foo: Int?;
    bar: Bool = true;
    baz: Int = 5;

    init() {
        self.foo = null;
        self.bar = false;
        self.baz = 10;
    }
}