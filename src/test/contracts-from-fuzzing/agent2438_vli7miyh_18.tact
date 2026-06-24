contract OptionalSerialization {
    foo: Int? as uint32;
    bar: Bool?;

    init() {
        self.foo = null;
        self.bar = null;
    }
}
