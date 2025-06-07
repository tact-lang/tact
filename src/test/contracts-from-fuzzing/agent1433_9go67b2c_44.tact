contract DefaultMixedOpt {
    a: Int = 1;
    b: String = "b";
    c: Int?;
    d: String?;

    init() {
        self.c = null;
        self.d = null;
    }
}
