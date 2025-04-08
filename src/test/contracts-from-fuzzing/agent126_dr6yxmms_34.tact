contract ExplicitOptionalNull {
    foo: Int? as uint64;

    init() {
        self.foo = null;
    }
}