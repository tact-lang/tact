contract DefaultsOpt {
    foo: Int?;
    bar: Bool? = null;
    baz: String? = null;

    init() {
        self.foo = null;
    }
}