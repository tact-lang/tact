contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Address;
    f6: Slice;
    f7: Bool?;
    f8: Int?;
    f9: String;
    f10: Bool;
    f11: Int;
    f12: String;
    f13: Address;
    f14: Cell;
    f15: Slice;
    
    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "a";
        self.f4 = emptyCell();
        self.f5 = myAddress();
        self.f6 = emptyCell().asSlice();
        self.f7 = null;
        self.f8 = null;
        self.f9 = "b";
        self.f10 = false;
        self.f11 = 11;
        self.f12 = "c";
        self.f13 = myAddress();
        self.f14 = emptyCell();
        self.f15 = emptyCell().asSlice();
    }
}