contract FuzzTest {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    e: Cell;
    f: Slice?;
    g: Builder;

    init() {
        self.a = 100;
        self.b = null;
        self.c = "hello";
        self.d = null;
        self.e = emptyCell();
        self.f = null;
        self.g = beginCell();
    }
}
