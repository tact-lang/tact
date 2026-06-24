contract BoolOptionalDefault {
    a: Bool? = false;
    b: Bool? = null;

    init() {
        self.a = true;
        self.b = true;
    }
}
