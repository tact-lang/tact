contract ManyFields {
    
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Builder;
    f7: Address;
    
    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "test";
        self.f4 = emptyCell();
        self.f5 = emptyCell().asSlice();
        self.f6 = beginCell();
        self.f7 = myAddress();
    }
}
