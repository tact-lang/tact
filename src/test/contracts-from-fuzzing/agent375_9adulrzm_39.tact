// Large contract with many primitive and optional fields intermixed
contract LargeMix {
    a1: Int;
    a2: Int?;
    b1: Bool;
    b2: Bool?;
    s1: String;
    s2: String?;
    ce1: Cell;
    ce2: Cell?;
    sl1: Slice;
    sl2: Slice?;
    bu1: Builder;
    bu2: Builder?;
    addr1: Address;
    addr2: Address?;

    init() {
        self.a1 = 123;
        self.a2 = null;
        self.b1 = true;
        self.b2 = false;
        self.s1 = "abc";
        self.s2 = null;
        self.ce1 = emptyCell();
        self.ce2 = null;
        self.sl1 = emptyCell().asSlice();
        self.sl2 = null;
        self.bu1 = beginCell();
        self.bu2 = null;
        self.addr1 = myAddress();
        self.addr2 = null;
    }
}
