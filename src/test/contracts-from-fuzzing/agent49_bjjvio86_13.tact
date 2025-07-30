contract LargeFlatFields {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Address;
    f5: Slice;
    f6: Bool;
    f7: Int;
    f8: Int?;
    f9: String;
    f10: Bool;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = null;
        self.f4 = myAddress();
        self.f5 = emptyCell().asSlice();
        self.f6 = true;
        self.f7 = -7;
        self.f8 = 8;
        self.f9 = "large";
        self.f10 = true;
    }
}
