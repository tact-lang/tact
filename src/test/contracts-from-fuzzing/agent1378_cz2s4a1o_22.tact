contract OptionalContract {
    foo: Int?;
    bar: Bool?;
    str: String?;

    init() {
        self.foo = null;
        self.bar = null;
        self.str = null;
    }
    receive() {}
}