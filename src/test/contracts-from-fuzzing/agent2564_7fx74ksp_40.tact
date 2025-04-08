contract SparseOptional {
    a: Int?;
    b: Int;
    c: Int?;
    d: Bool;
    e: Bool?;

    init() {
        self.a = null;
        self.b = 1;
        self.c = null;
        self.d = true;
        self.e = null;
    }
}