contract ManyPrimitives {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
    d: Address;
    e: Cell;
    f: Slice;

    init() {
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
    }
}