contract OptionalVsNonOptional {
    a: Int;
    b: Int?;

    init() {
        self.a = 42;
        self.b = null;
    }
}