contract TestContract {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: String;
    f6: Address;
    f7: Cell;
    f8: Slice;
    f9: String?;
    f10: Address?;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = null;
        self.f4 = null;
        self.f5 = "hello";
        self.f6 = myAddress();
        self.f7 = emptyCell();
        self.f8 = emptyCell().asSlice();
        self.f9 = null;
        self.f10 = null;
    }
}