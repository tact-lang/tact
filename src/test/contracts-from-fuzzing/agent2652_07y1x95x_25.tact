contract OptionalAssign {
    foo: Int?;
    init() {
        self.foo = null;
        self.foo = 10;
    }
}