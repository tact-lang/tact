// Large contract with mixed types, default init
contract TestContract {
    i1: Int = 1;
    i2: Int = 2;
    b1: Bool = true;
    b2: Bool = false;
    s1: String = "one";
    s2: String = "two";
    a1: Address;
    a2: Address;
    c1: Cell;
    c2: Cell;
    sl1: Slice;
    sl2: Slice;
    bu1: Builder;
    bu2: Builder;

    init() {
        self.i1 = 10;
        self.i2 = 20;
        self.b1 = false;
        self.b2 = true;
        self.s1 = "foo";
        self.s2 = "bar";
        self.a1 = myAddress();
        self.a2 = myAddress();
        self.c1 = emptyCell();
        self.c2 = emptyCell();
        self.sl1 = emptyCell().asSlice();
        self.sl2 = emptyCell().asSlice();
        self.bu1 = beginCell();
        self.bu2 = beginCell();
    }

    receive() {
        let _ = self.i1 + self.i2;
    }
}