contract BoolMix {
    a: Bool = true;
    b: Bool? = null;
    c: Bool = false;
    d: Bool? = null;

    init() {
        self.b = true;
        self.d = false;
    }
}
