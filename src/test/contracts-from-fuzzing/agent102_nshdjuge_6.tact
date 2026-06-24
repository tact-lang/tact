contract DefaultOptionalNestedTest {
    a: Int?;
    b: Bool = false;
    c: String?;
    d: Address;
    e: Cell?;
    f: Slice;
    g: Int = 123;

    init() {
        self.a = null;
        self.c = "abc";
        self.d = myAddress();
        self.e = null;
        self.f = emptyCell().asSlice();
    }
}
