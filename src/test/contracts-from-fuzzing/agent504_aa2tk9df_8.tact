contract LongFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: String;
    f8: Int;
    f9: Int;
    f10: Bool;
    f11: String;
    f12: Bool;
    f13: Int;
    f14: Bool;
    f15: Int;
    f16: Address;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "f3";
        self.f4 = myAddress();
        self.f5 = emptyCell();
        self.f6 = self.f5.asSlice();
        self.f7 = "f7";
        self.f8 = 8;
        self.f9 = 9;
        self.f10 = true;
        self.f11 = "f11";
        self.f12 = false;
        self.f13 = 13;
        self.f14 = true;
        self.f15 = 15;
        self.f16 = myAddress();
    }
}