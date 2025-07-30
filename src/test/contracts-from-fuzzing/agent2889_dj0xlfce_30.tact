contract ChainOptionalDefaults {
    a: Int? = null;
    b: Int? = 3;
    c: Bool? = null;

    init() {
        self.a = 1;
        self.b = null;
        self.c = false;
    }
}