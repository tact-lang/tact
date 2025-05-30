contract OnlyBoolOpt {
    a: Bool? = null;
    b: Bool? = true;
    c: Bool? = false;

    init() {
        self.a = false;
        self.b = null;
        self.c = true;
    }
}