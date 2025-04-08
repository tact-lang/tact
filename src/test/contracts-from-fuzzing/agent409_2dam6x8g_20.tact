contract LongList {
    f1: Int; f2: Bool; f3: Int?; f4: Bool?; f5: Cell; f6: Slice;
    f7: Builder; f8: Address; f9: String; f10: Int?;

    init() {
        self.f1 = 1; self.f2 = true; self.f3 = null; self.f4 = null; self.f5 = emptyCell();
        self.f6 = emptyCell().asSlice(); self.f7 = beginCell(); self.f8 = myAddress();
        self.f9 = ""; self.f10 = null;
    }
}