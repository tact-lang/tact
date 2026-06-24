contract TestContract {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;

    init() {
        self.a = 10;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
    }
}