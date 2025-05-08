contract OptionalAtInit {
    foo: Int?;

    init() {
        self.foo = null;
    }

    receive() {
        if (self.foo == null) {
            self.foo = 555;
        }
    }
}