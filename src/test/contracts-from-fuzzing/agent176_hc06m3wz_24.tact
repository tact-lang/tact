contract BoolOptionalMix {
    a: Bool = true;
    b: Bool? = false;
    c: Bool? = null;

    init() {
        self.b = null;
        self.c = true;
    }
}