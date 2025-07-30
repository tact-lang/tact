contract SparseWithDefaults {
    a: Int?;
    b: Int = 5;
    c: Bool?;
    d: Bool = false;
    e: String?;
    f: String = "xyz";

    init() {
        self.a = null;
        self.c = null;
        self.e = null;
    }
}