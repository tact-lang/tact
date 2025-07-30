contract OptionMix {
    a: Int?;
    b: Int?;
    c: Bool = false;
    d: Bool = true;

    init() {
        self.a = null;
        self.b = null;
        self.c = true;
        self.d = false;
    }
}