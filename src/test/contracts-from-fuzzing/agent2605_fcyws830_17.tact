contract SparseDefaults {
    a: Int = 5;
    b: Bool;
    c: Int?;
    d: Bool = true;
    e: String?;

    init() {
        self.b = false;
        self.c = null;
        self.e = null;
    }
}
