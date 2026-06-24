contract OptionalVsDefault {
    a: Int?;
    b: Int = 0;

    init() {
        self.a = 42;
        self.b = 43;
    }
}
