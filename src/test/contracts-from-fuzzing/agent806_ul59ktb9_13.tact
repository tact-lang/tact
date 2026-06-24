contract OptionalAndNon {
    a: Int?;
    b: Int = 99;

    init() {
        self.a = null;
        self.b = 1337;
    }
}