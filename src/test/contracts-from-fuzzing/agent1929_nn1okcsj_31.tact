contract OptionalAdditions {
    a: Int?;
    b: Bool?;

    init() {
        self.a = 1;
        self.b = false;
        self.a = null;
        self.b = true;
    }
}