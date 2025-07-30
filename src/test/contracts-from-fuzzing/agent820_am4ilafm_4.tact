contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: Cell;
    f4: Address;
    f5: String;
    f6: Slice;
    f7: Builder;
    
    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = emptyCell();
        self.f4 = myAddress();
        self.f5 = "test";
        self.f6 = emptyCell().asSlice();
        self.f7 = beginCell();
    }
}