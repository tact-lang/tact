contract TestLongFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Builder;
    f7: Int?;
    f8: Bool?;
    f9: String?;
    f10: Cell?;
    f11: Slice?;
    f12: Builder?;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "abc";
        self.f4 = emptyCell();
        self.f5 = emptyCell().asSlice();
        self.f6 = beginCell();
        self.f7 = null;
        self.f8 = false;
        self.f9 = null;
        self.f10 = null;
        self.f11 = null;
        self.f12 = null;
    }
}