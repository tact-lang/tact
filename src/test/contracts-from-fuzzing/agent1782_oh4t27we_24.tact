contract OptionalSerInline {
    foo: Int? as uint32 = null;
    bar: Bool? = null;

    init() {
        self.foo = 123456;
        self.bar = true;
    }
}