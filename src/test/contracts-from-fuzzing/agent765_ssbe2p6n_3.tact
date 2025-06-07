contract ManyFields {
    a: Int = 1;
    b: Bool = true;
    c: String = "test";
    d: Cell;
    e: Slice;
    f: Address;
    g: Int = 42;
    h: Bool = false;
    i: Int = -7;
    j: Bool = true;

    init() {
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
    }
}