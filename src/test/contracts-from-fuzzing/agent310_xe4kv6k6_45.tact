contract OptionalAssignmentOverwrite {
    a: Int?;

    init() {
        self.a = 1;
        self.a = null;
    }
}