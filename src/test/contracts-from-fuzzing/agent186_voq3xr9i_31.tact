contract OptionalsInitialized {
    a: Int? = 10;
    b: Int? = null;
    c: Bool? = true;
    d: Bool? = null;
    s: String? = "hi";

    init() {
        self.a = null;
        self.b = 15;
        self.c = null;
        self.d = true;
        self.s = null;
    }
}