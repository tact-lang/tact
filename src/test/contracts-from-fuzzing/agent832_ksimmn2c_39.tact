contract OptionalAssignment {
    x: Int?;

    init() {
        self.x = 5;
        self.x = null;
    }
}