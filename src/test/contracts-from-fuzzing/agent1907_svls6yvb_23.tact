contract OptionalWithValueDefault {
    foo: Int? = 5;

    init() {
        self.foo = null;
    }
}