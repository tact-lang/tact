contract OptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: String?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }

    receive() {
        self.a = 10;
    }
}