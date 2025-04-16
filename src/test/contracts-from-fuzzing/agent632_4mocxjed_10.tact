contract TestContract {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: String;
    f6: Int?;
    f7: Bool?;
    f8: Address?;
    f9: Cell?;
    f10: String?;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = myAddress();
        self.f4 = emptyCell();
        self.f5 = "test";
        self.f6 = null;
        self.f7 = null;
        self.f8 = null;
        self.f9 = null;
        self.f10 = null;
    }
}