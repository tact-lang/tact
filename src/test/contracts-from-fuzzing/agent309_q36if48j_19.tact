contract OptionalVsNonOptionalPersist {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
    d: Bool?;

    init() {
        self.b = null;
        self.d = null;
    }
}