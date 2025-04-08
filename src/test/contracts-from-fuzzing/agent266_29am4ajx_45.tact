contract OptionalSerialization {
    foo: Int? as uint8;

    init() {
        self.foo = null;
    }
}