contract OptionalsDefaultNullTest {
    a: Int?;
    b: Bool?;
    s: Slice?;
    c: Cell?;

    init() {
        self.a = null;
        self.b = null;
        self.s = null;
        self.c = null;
    }
}