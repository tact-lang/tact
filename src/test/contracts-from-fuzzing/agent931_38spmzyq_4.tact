contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Address;
    f6: Int?;
    f7: Bool?;
    f8: String?;
    f9: Cell?;
    f10: Address?;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "hi";
        self.f4 = emptyCell();
        self.f5 = myAddress();
        self.f6 = null;
        self.f7 = null;
        self.f8 = null;
        self.f9 = null;
        self.f10 = null;
    }
}