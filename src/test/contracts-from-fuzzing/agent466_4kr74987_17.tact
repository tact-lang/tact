contract OptionalDefaults {
    foo: Int?;
    bar: Bool?;

    init() {
        self.foo = null;
        self.bar = null;
    }

    receive() {
        if (self.foo == null) {
            self.foo = 42;
        }
        if (self.bar == null) {
            self.bar = true;
        }
    }
}