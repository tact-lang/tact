contract OptionalMixTop {
    foo: Int?;
    bar: Bool;
    baz: String?;

    init() {
        self.foo = null;
        self.bar = false;
        self.baz = null;
    }

    receive() {
        self.foo = 10;
        self.bar = true;
        self.baz = "xx";
    }
}