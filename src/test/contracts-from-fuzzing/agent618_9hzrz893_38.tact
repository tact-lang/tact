contract OptionalSetOnlyOne {
    foo: Int?;
    bar: Bool?;

    init() {
        self.foo = null;
        self.bar = false;
    }
}