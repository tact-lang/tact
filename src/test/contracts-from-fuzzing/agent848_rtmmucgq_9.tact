contract OptionalFieldNullInit {
    foo: Int?;

    init() {
        self.foo = null;
    }
}