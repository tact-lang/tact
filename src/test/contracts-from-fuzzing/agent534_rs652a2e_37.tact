contract ManyFieldsAllTypes {
    i: Int = 5;
    b: Bool = true;
    addr: Address;
    c: Cell;
    sl: Slice;
    s: String = "x";
    oi: Int? = null;
    ob: Bool? = null;
    oa: Address? = null;
    oc: Cell? = null;
    osl: Slice? = null;
    os: String? = null;

    init() {
        self.addr = myAddress();
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
    }
}