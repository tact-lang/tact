struct Nested {
    n1: Int;
    n2: Bool;
}

contract TestContract {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Builder;
    f6: Slice;
    f7: Address;
    f8: String?;
    f9: Int?;
    f10: Bool?;
    f11: Cell?;
    f12: Builder?;
    f13: Slice?;
    f14: Address?;
    f15: Nested;
    f16: Nested?;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "hello";
        self.f4 = emptyCell();
        self.f5 = beginCell();
        self.f6 = emptyCell().asSlice();
        self.f7 = myAddress();
        self.f8 = null;
        self.f9 = null;
        self.f10 = null;
        self.f11 = null;
        self.f12 = null;
        self.f13 = null;
        self.f14 = null;
        self.f15 = Nested{ n1: 10, n2: false };
        self.f16 = null;
    }
}
