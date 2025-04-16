contract OptionalFieldsPersistence {
    foo: Int?;
    bar: Int?;

    init() {
        self.foo = null;
        self.bar = null;
    }

    receive() {
        let _ = self.foo;
        let _ = self.bar;
    }
}