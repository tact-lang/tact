contract OptionalUninit {
    foo: Int?;
    bar: Bool?;

    init() {
        self.foo = null;
        self.bar = null;
    }

    receive() {
        if (self.foo == null) {
            self.foo = 7;
        }
    }
}