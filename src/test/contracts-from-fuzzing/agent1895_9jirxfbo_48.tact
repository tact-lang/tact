contract OptOverride {
    a: Int?;
    b: Bool?;

    init() {
        self.a = 123;
        self.b = null;
    }
}