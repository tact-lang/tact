// Test contract with many optional scalars, mix null and set
contract OptMix {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = emptyCell();
        self.e = null;
    }
}