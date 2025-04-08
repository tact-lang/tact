contract OptionalSelfAssign {
    a: Int?;
    b: Bool?;

    init() {
        self.a = self.a;
        self.b = self.b;
    }
}