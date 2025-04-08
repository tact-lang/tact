contract LargeFlatFields {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String;
    f7: Int?;
    f8: Bool?;
    f9: Address?;
    f10: Cell?;
    
    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = myAddress();
        self.f4 = emptyCell();
        self.f5 = emptyCell().asSlice();
        self.f6 = "hello";
        self.f7 = 123;
        self.f8 = false;
        self.f9 = null;
        self.f10 = null;
    }
}