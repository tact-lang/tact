contract MultiVars {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.d = null;
        self.e = true;
        self.f = null;
    }
}