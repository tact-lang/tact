// Testing a contract with a long list of primitive persistent fields
contract LongFieldList {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Bool;
    f5: String;
    f6: Address;
    f7: Cell;
    f8: Builder;
    f9: Slice;
    f10: Int;
    f11: Bool;
    f12: String;
    f13: Address;
    f14: Cell;
    f15: Slice;

    init() {
        self.f1 = 1;
        self.f2 = 2;
        self.f3 = true;
        self.f4 = false;
        self.f5 = "abc";
        self.f6 = myAddress();
        self.f7 = emptyCell();
        self.f8 = beginCell();
        self.f9 = emptyCell().asSlice();
        self.f10 = 10;
        self.f11 = false;
        self.f12 = "xyz";
        self.f13 = myAddress();
        self.f14 = emptyCell();
        self.f15 = emptyCell().asSlice();
    }
}