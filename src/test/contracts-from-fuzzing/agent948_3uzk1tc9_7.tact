contract OptionalPrimitiveTest {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: Builder?;
    g: String?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = beginCell();
        self.g = "hello";
    }
}