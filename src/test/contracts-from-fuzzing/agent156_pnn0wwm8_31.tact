contract OptionalWithDefault {
    a: Int = 99;
    b: Int? = null;

    init() {
        self.b = 123;
    }
}
