contract DefaultsAndOverrides {
    foo: Int = 10;
    bar: Bool = true;
    baz: Int?;

    init() {
        self.foo = 999;
        self.bar = false;
        self.baz = null;
    }
}