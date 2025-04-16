contract LargeFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Int?;
    f8: String?;
    f9: Bool?;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "ok";
        self.f4 = myAddress();
        self.f5 = emptyCell();
        self.f6 = emptyCell().asSlice();
        self.f7 = null;
        self.f8 = null;
        self.f9 = true;
    }
}