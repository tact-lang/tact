contract MaximalFieldsTest {
    f1: Int;
    f2: Bool;
    f3: Cell;
    f4: Slice;
    f5: String;
    f6: Address;
    f7: Bool?;
    f8: Int?;
    f9: Address?;
    f10: Cell?;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = emptyCell();
        self.f4 = emptyCell().asSlice();
        self.f5 = "max";
        self.f6 = myAddress();
        self.f7 = false;
        self.f8 = 42;
        self.f9 = myAddress();
        self.f10 = emptyCell();
    }
}