contract BoolOptionalMix {
    a: Bool = false;
    b: Bool?;
    c: Bool = true;
    d: Bool?;

    init() {
        self.b = null;
        self.d = true;
    }
}