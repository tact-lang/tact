contract OptionalPrimitives {
    i: Int?;
    b: Bool?;
    s: String?;

    init() {
        self.i = null;
        self.b = null;
        self.s = null;
    }

    receive() {
        self.i = 10;
        self.b = true;
        self.s = "hi";
    }
}
