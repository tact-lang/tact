contract OptionalUninitialized {
    n1: Int?;
    n2: String?;

    init() {
        self.n1 = null;
        self.n2 = null;
    }
}