contract OptionalVsDefault {
    a: Int? = null;
    b: Bool? = true;

    init() {
        self.a = 123;
        self.b = null;
    }
}