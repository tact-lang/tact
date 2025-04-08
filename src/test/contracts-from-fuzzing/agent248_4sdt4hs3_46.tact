contract DefaultMix {
    a: Int;
    b: Bool? = null;
    c: String = "s";
    d: Address?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "x";
        self.d = myAddress();
    }
}