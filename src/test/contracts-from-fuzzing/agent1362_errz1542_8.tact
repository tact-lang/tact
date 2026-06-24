contract ManyFields {
    a: Int = 1;
    b: Bool = true;
    c: Address;
    d: Cell;
    e: Slice;
    f: String = "test";
    g: Int? = null;
    h: Bool? = null;
    i: Address? = null;
    j: Cell? = null;
    k: Slice? = null;
    l: String? = null;

    init() {
        self.c = myAddress();
        self.d = emptyCell();
        self.e = self.d.asSlice();
    }
}