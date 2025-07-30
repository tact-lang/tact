contract LargeFlatPersist {
    a: Int = 1;
    b: Int = 2;
    c: Bool = false;
    d: String = "x";
    e: Int?;
    f: Bool?;
    g: String?;

    init() {
        self.e = null;
        self.f = null;
        self.g = null;
    }
}