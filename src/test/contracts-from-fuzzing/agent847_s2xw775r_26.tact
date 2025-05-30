contract OptionalOrdering {
    f1: Int?;
    f2: Bool;
    f3: Bool?;
    f4: Int;
    f5: String?;

    init() {
        self.f1 = null;
        self.f2 = true;
        self.f3 = null;
        self.f4 = 42;
        self.f5 = null;
    }
}