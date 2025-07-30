contract OptAssign {
    a: Int?;

    init() {
        self.a = null;
        self.a = 42;
    }
}