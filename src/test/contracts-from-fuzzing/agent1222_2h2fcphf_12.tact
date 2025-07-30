contract OptionalAssignment {
    a: Int?;

    init() {
        self.a = 1;
        self.a = null;
    }
}