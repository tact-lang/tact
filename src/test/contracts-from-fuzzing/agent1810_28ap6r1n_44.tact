contract OptAssignLater {
    a: Int?;

    init() {
        self.a = null;
        self.a = 123;
    }
}