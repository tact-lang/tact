contract OptionalOverrides {
    a: Int?;
    b: Int?;

    init() {
        self.a = 5;
        self.b = null;
        self.b = 20;
        self.a = null;
    }
}