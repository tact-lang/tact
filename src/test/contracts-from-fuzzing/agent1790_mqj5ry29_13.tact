contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: Bool?;
    f4: Cell;
    f5: Slice;
    f6: String;
    f7: Address;
    f8: Int?;
    f9: String;
    f10: Address?;

    init() {
        self.f1 = 0;
        self.f2 = false;
        self.f3 = null;
        self.f4 = emptyCell();
        self.f5 = emptyCell().asSlice();
        self.f6 = "abc";
        self.f7 = myAddress();
        self.f8 = null;
        self.f9 = "";
        self.f10 = null;
    }
}
