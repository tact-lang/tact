struct S {
    a: Int
}

contract LongList {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Int;
    f8: Int;
    f9: Int;
    f10: Int;
    f11: Bool;
    f12: Bool;
    f13: Bool;
    f14: String;
    f15: String;
    f16: Slice;
    f17: Cell;
    f18: Address;
    f19: Int?;
    f20: Bool?;
    largeStruct: S;

    init() {
        self.f1 = 1;
        self.f2 = 2;
        self.f3 = 3;
        self.f4 = 4;
        self.f5 = 5;
        self.f6 = 6;
        self.f7 = 7;
        self.f8 = 8;
        self.f9 = 9;
        self.f10 = 10;
        self.f11 = false;
        self.f12 = true;
        self.f13 = false;
        self.f14 = "a";
        self.f15 = "b";
        self.f16 = emptyCell().asSlice();
        self.f17 = emptyCell();
        self.f18 = myAddress();
        self.f19 = null;
        self.f20 = null;
        self.largeStruct = S{a: 42};
    }
}