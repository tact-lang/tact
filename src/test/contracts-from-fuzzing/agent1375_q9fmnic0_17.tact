contract ManyFieldsBig {
    f1: Int; f2: Bool; f3: String; f4: Int?; f5: Bool?;
    f6: Address; f7: Address?; f8: Cell; f9: Cell?; f10: String?;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "test";
        self.f4 = null;
        self.f5 = null;
        self.f6 = myAddress();
        self.f7 = null;
        self.f8 = emptyCell();
        self.f9 = null;
        self.f10 = null;
    }
}