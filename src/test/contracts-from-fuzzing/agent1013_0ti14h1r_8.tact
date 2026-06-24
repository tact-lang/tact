contract LotsOfFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Builder;
    f8: Int?;
    f9: Bool?;
    f10: String?;
    
    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "abc";
        self.f4 = myAddress();
        self.f5 = emptyCell();
        self.f6 = emptyCell().asSlice();
        self.f7 = beginCell();
        self.f8 = null;
        self.f9 = null;
        self.f10 = null;
    }
}