contract IntOptionalDefaults {
    a: Int? = null;
    b: Int? = 1;
    c: Int? = -1;

    init() {
        self.a = 2;
        self.b = null;
        self.c = 3;
    }
}