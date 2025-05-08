contract ManyFieldsContract {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Address;
    f7: Int?;
    f8: Bool?;
    f9: String?;
    f10: Int;
    f11: Bool;
    f12: String;
    f13: Cell;
    f14: Slice;
    f15: Address;
    f16: Int?;
    f17: Bool?;
    f18: String?;

    init() {
        self.f1 = 0;
        self.f2 = true;
        self.f3 = "a";
        self.f4 = emptyCell();
        self.f5 = emptyCell().asSlice();
        self.f6 = myAddress();
        self.f7 = null;
        self.f8 = null;
        self.f9 = null;
        self.f10 = 10;
        self.f11 = false;
        self.f12 = "b";
        self.f13 = emptyCell();
        self.f14 = emptyCell().asSlice();
        self.f15 = myAddress();
        self.f16 = null;
        self.f17 = null;
        self.f18 = null;
    }
}