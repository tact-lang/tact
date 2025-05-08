contract DefaultAndOpt {
    a: Int = 42;
    b: Int?;
    c: Bool = false;
    d: Bool?;
    e: String = "x";
    f: String?;

    init() {
        self.b = null;
        self.d = null;
        self.f = null;
    }
}
