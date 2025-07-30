contract SerialOrdering {
    a: Int as uint4;
    b: Int;
    c: Bool;
    d: String?;
    e: Bool?;

    init() {
        self.a = 3;
        self.b = 10;
        self.c = true;
        self.d = null;
        self.e = null;
    }
}
