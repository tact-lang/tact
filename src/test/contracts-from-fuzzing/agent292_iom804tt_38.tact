contract OptionalAssign {
    a: Int?;
    init() {
        self.a = null;
        self.a = 5;
        self.a = null;
    }
}