contract OptionalAssign {
    foo: Int?;
    bar: Bool?;

    init() {
        self.foo = 123;
        self.bar = true;
    }
}