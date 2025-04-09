contract OptBoolDefault {
    a: Bool? = null;
    b: Bool? = true;

    init() {
        self.a = false;
        self.b = null;
    }
}