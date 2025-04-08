contract OptionalAsField {
    foo: Int? as uint8;

    init() {
        self.foo = null;
    }
}
