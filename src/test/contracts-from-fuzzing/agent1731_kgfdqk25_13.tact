contract ManyFieldsLong {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Cell;
    f8: Address;
    f9: Cell?;
    f10: Address?;
    f11: Int;
    f12: Bool;
    f13: String;
    f14: Int?;
    f15: Bool?;
    f16: String?;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "hi";
        self.f4 = 4;
        self.f5 = null;
        self.f6 = null;
        self.f7 = emptyCell();
        self.f8 = myAddress();
        self.f9 = null;
        self.f10 = null;
        self.f11 = 11;
        self.f12 = true;
        self.f13 = "yo";
        self.f14 = null;
        self.f15 = false;
        self.f16 = "hey";
    }
}
