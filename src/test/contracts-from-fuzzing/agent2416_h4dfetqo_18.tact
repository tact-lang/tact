contract DiversePrimitives {
    a: Int = 0;
    b: Bool = true;
    c: Address;
    d: Cell;
    e: Slice;
    f: String = "hello";

    init() {
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
    }
}