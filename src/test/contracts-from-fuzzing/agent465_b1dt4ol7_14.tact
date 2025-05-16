// Edge: large contract with many mixed persistent fields
contract TestContract {
    i1: Int = 1;
    i2: Int = 2;
    b1: Bool = true;
    b2: Bool = false;
    s1: String = "a";
    s2: String = "b";
    a1: Address;
    a2: Address;
    c1: Cell;
    c2: Cell;
    sl1: Slice;
    sl2: Slice;
    bl1: Builder;
    bl2: Builder;

    init() {
        self.a1 = myAddress();
        self.a2 = myAddress();
        self.c1 = emptyCell();
        self.c2 = emptyCell();
        self.sl1 = emptyCell().asSlice();
        self.sl2 = emptyCell().asSlice();
        self.bl1 = beginCell();
        self.bl2 = beginCell();
    }
}
