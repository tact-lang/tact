contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: Address;
    d: Cell;
    e: Slice;
    f: String = "test";

    init() {
        self.a = 2;
        self.b = false;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = beginCell().endCell().asSlice();
        self.f = "changed";
    }
}
