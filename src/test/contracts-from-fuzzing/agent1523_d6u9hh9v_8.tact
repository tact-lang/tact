contract OptionalStorage {
    foo: Int?;
    bar: Bool?;

    init() {
        self.foo = null;
        self.bar = null;
    }

    receive() {
        self.foo = 42;
        self.bar = true;
    }
}