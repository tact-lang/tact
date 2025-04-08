contract ManyTypes {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
    d: Bool?;
    e: Address;
    f: Address?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
    k: String = "abc";
    l: String?;

    init() {
        self.b = null;
        self.d = null;
        self.e = myAddress();
        self.f = null;
        self.g = emptyCell();
        self.h = null;
        self.i = emptyCell().asSlice();
        self.j = null;
        self.l = null;
    }
}
