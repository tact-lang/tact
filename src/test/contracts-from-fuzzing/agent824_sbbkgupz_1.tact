contract TestContract {
    i1: Int;
    b1: Bool;
    s1: String;
    c1: Cell;
    a1: Address;
    slice1: Slice;
    builder1: Builder;

    init() {
        self.i1 = 1;
        self.b1 = true;
        self.s1 = "abc";
        self.c1 = emptyCell();
        self.a1 = myAddress();
        self.slice1 = self.c1.asSlice();
        self.builder1 = beginCell();
    }
}
