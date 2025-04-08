contract FatFlat {
    i1: Int = 1;
    i2: Int = 2;
    i3: Int = 3;
    b1: Bool = false;
    b2: Bool = true;
    s1: String = "a";
    s2: String = "b";
    a1: Address;
    a2: Address;
    c1: Cell;
    sl1: Slice;
    bu1: Builder;
    opti: Int? = null;
    opts: String? = null;
    optb: Bool? = null;
    opta: Address? = null;

    init() {
        self.a1 = myAddress();
        self.a2 = myAddress();
        self.c1 = emptyCell();
        self.sl1 = emptyCell().asSlice();
        self.bu1 = beginCell();
    }
}