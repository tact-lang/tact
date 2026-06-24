contract LargeContract {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String;
    f7: Int?;
    f8: Bool?;
    f9: Address?;
    f10: Cell?;
    f11: Slice?;
    f12: String?;
    f13: Int = 1;
    f14: Bool = false;
    f15: String = "Hi";

    init() {
        self.f1 = 123;
        self.f2 = true;
        self.f3 = myAddress();
        self.f4 = emptyCell();
        self.f5 = emptyCell().asSlice();
        self.f6 = "A";
        self.f7 = null;
        self.f8 = null;
        self.f9 = null;
        self.f10 = null;
        self.f11 = null;
        self.f12 = null;
        self.f13 = 2;
        self.f14 = true;
        self.f15 = "Bye";
    }
}