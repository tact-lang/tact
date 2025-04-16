contract OptionalPrimitives {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;

    init() {
        self.a = 123;
        self.b = true;
        self.c = "hello";
    }
}