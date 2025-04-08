contract TestContract {
    // persistent optional fields with default null
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}
