contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: Address? = null;
    d: Cell;
    e: Slice;
    f: String = "hello";
    g: Builder;

    init() {
        self.a = 42;
        self.b = false;
        self.c = null;
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "world";
        self.g = beginCell();
    }
}