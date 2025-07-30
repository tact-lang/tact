contract DirectLong {
    f1: Int; f2: Bool; f3: String; f4: Int?; f5: Bool?;
    f6: String?; f7: Cell; f8: Slice; f9: Cell?; f10: Slice?;
    f11: Int; f12: Int; f13: Int; f14: Int; f15: Int;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "test";
        self.f4 = null;
        self.f5 = null;
        self.f6 = null;
        self.f7 = emptyCell();
        self.f8 = emptyCell().asSlice();
        self.f9 = null;
        self.f10 = null;
        self.f11 = 11;
        self.f12 = 12;
        self.f13 = 13;
        self.f14 = 14;
        self.f15 = 15;
    }
}