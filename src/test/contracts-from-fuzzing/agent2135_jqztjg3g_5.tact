contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: String;
    f6: Cell;
    f7: Slice;
    f8: Address;
    f9: Int;
    f10: Bool;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = 2;
        self.f4 = false;
        self.f5 = "hi";
        self.f6 = emptyCell();
        self.f7 = emptyCell().asSlice();
        self.f8 = myAddress();
        self.f9 = 9;
        self.f10 = false;
    }
}