contract ManyOptionals {
    f1: Int?;
    f2: Int?;
    f3: Bool?;
    f4: Bool?;
    f5: Slice?;
    f6: Slice?;
    f7: Cell?;
    f8: Cell?;
    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = true;
        self.f4 = null;
        self.f5 = emptyCell().asSlice();
        self.f6 = null;
        self.f7 = emptyCell();
        self.f8 = null;
    }
}
