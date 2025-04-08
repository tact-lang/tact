contract OptionalInlineSer {
    foo: Int? as uint64 = null;
    bar: String? = null;

    init() {
        self.foo = 1234567890;
        self.bar = "ok";
    }
}