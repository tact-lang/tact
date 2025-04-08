contract NestedNullables {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Cell?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}