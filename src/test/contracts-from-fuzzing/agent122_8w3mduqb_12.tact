contract OnlyOptionals {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
    d: String? = null;
    init() {
        self.a = 10;
        self.b = true;
        self.c = null;
        self.d = "x";
    }
}
