contract Test {
    a: Int = 1;
    b: Bool = true;
    f: String = "hello";

    c: Cell;
    d: Slice;
    e: Address;
    g: Int?;

    init() {
        self.c = emptyCell();
        self.d = emptyCell().asSlice();
        self.e = myAddress();
        self.g = null;
    }
}