contract ManyFields {
    a: Int = 1;
    b: Bool = false;
    c: String = "a";
    d: Slice;
    e: Cell;
    f: Address;
    g: Int? = null;

    init() {
        self.d = emptyCell().asSlice();
        self.e = emptyCell();
        self.f = myAddress();
    }
}