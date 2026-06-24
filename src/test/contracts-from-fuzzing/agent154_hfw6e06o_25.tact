contract NestedContractFields {
    a: Int;
    b: Bool;
    c: Address;
    d: Slice;
    e: Cell;
    f: String;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: Slice?;
    k: Cell?;
    l: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell().asSlice();
        self.e = emptyCell();
        self.f = "str";
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
    }
}