contract OptionalPrimitives {
    i: Int?;
    b: Bool?;
    s: String?;

    init() {
        self.i = 77;
        self.b = null;
        self.s = "message";
    }
}