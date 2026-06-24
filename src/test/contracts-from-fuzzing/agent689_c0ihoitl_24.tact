contract OptionalFieldPrimitiveDefault {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;

    init() {
        self.a = 1;
        self.b = false;
        self.c = null;
    }
}