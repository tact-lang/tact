contract OptionalVsDefault {
    a: Int?;
    b: Int = 0;

    init() {
        self.a = null;
        self.b = 42;
    }
}