contract NestedOptionalsFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Int;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = 42;
    }
}