contract SparseDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "h";
    d: Int?;

    init() {
        self.b = true;
        self.d = null;
    }
}