contract ManyPrimitives {
    a: Int = 1;
    b: Bool = false;
    c: Address;
    d: Cell;
    e: Slice;
    f: String = "hi";

    init() {
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
    }
}