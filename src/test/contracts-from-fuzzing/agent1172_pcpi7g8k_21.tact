contract DefaultsMix {
    f1: Int = 5;
    f2: Bool;
    f3: String = "hi";
    f4: Cell;
    f5: Slice;
    f6: Builder;
    f7: Int?;
    f8: Bool?;
    f9: String?;

    init() {
        self.f2 = false;
        self.f4 = emptyCell();
        self.f5 = beginCell().endCell().asSlice();
        self.f6 = beginCell();
        self.f7 = null;
        self.f8 = null;
        self.f9 = null;
    }
}