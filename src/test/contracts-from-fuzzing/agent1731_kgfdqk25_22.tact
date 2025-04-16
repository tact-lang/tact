contract DefaultMix {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.d = null;
        self.e = null;
        self.f = null;
    }
}
