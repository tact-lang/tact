contract ManyFields {
    a: Int = 1;
    b: Bool = false;
    c: String = "";
    d: Cell;
    e: Slice;
    f: Address;
    g: Int? = null;
    h: String? = null;
    i: Bool? = null;
    j: Cell? = null;
    k: Slice? = null;
    l: Address? = null;

    init() {
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
    }
}