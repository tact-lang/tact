contract LargeMix {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: Address;
    f6: Address?;
    f7: Cell;
    f8: Cell?;
    f9: String;
    f10: String?;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = null;
        self.f4 = null;
        self.f5 = myAddress();
        self.f6 = null;
        self.f7 = emptyCell();
        self.f8 = null;
        self.f9 = "hi";
        self.f10 = null;
    }
}