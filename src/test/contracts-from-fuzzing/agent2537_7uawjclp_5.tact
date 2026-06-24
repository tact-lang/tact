contract LongList {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: String;
    f5: Int?;
    f6: Bool?;
    f7: String;
    f8: Cell;
    f9: Address;
    f10: Int;
    f11: Bool;
    f12: String;
    f13: Int?;
    f14: Bool?;
    f15: String;

    init() {
        self.f1 = 1;
        self.f2 = 2;
        self.f3 = true;
        self.f4 = "a";
        self.f5 = null;
        self.f6 = false;
        self.f7 = "b";
        self.f8 = emptyCell();
        self.f9 = myAddress();
        self.f10 = 10;
        self.f11 = false;
        self.f12 = "c";
        self.f13 = 13;
        self.f14 = true;
        self.f15 = "d";
    }
}