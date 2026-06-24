contract TestContract {
    a: Bool?;
    b: Int?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;

    init() {
        self.a = null;
        self.b = 5;
        self.c = null;
        self.d = null;
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
    }

    receive() {}
}