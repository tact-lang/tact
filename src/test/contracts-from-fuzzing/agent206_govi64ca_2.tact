contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: Cell;
    d: Address;
    e: Slice;
    f: String = "hello";
    g: Int? = null;

    init() {
        self.c = emptyCell();
        self.d = myAddress();
        self.e = emptyCell().asSlice();
    }
}
