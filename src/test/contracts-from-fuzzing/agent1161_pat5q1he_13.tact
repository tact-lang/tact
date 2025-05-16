contract ManyPersistentFields {
    f1: Int;
    f2: String;
    f3: Bool;
    f4: Int?;
    f5: String?;
    f6: Bool?;
    f7: Cell;
    f8: Address;
    f9: Cell?;
    f10: Address?;

    init() {
        self.f1 = 1;
        self.f2 = "abc";
        self.f3 = true;
        self.f4 = null;
        self.f5 = null;
        self.f6 = null;
        self.f7 = emptyCell();
        self.f8 = myAddress();
        self.f9 = null;
        self.f10 = null;
    }
}