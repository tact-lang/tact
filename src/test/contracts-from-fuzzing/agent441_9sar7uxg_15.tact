contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Cell; // uninitialized
    e: Slice; // uninitialized
    f: Address; // uninitialized

    init() {
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
    }
}