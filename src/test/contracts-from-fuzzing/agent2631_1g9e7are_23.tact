contract DefaultOnlyLiterals {
    a: Int = 42;
    b: Bool = false;
    c: String = "hello";
    d: Address;  // initialized in init
    e: Cell;
    f: Slice;

    init() {
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
    }
}