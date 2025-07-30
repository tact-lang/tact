contract ExplicitOptionalSerialization {
    foo: Int? as uint32;

    init() {
        self.foo = 12345;
    }
}