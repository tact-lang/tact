contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: Cell;
    f6: Slice;
    f7: String;
    f8: String?;
    f9: Int;
    f10: Bool;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = null;
        self.f4 = false;
        self.f5 = emptyCell();
        self.f6 = emptyCell().asSlice();
        self.f7 = "test";
        self.f8 = null;
        self.f9 = 9;
        self.f10 = false;
    }
}