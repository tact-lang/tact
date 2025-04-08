// contract with exactly 30 primitive fields
contract Thirty {
    f1: Int;      f2: Int;
    f3: Bool;     f4: Bool;
    f5: String;   f6: String;
    f7: Address;  f8: Address;
    f9: Cell;     f10: Cell;
    f11: Slice;   f12: Slice;
    f13: Int?;    f14: Int?;
    f15: Bool?;   f16: Bool?;
    f17: String?; f18: String?;
    f19: Address?;f20: Address?;
    f21: Cell?;   f22: Cell?;
    f23: Slice?;  f24: Slice?;
    f25: Int;     f26: Bool;
    f27: String;  f28: Address;
    f29: Cell;    f30: Slice;

    init() {
        self.f1 = 1; self.f2 = 2;
        self.f3 = true; self.f4 = false;
        self.f5 = "a"; self.f6 = "b";
        self.f7 = myAddress(); self.f8 = myAddress();
        self.f9 = emptyCell(); self.f10 = emptyCell();
        self.f11 = emptyCell().asSlice(); self.f12 = emptyCell().asSlice();
        self.f13 = null; self.f14 = null;
        self.f15 = null; self.f16 = null;
        self.f17 = null; self.f18 = null;
        self.f19 = null; self.f20 = null;
        self.f21 = null; self.f22 = null;
        self.f23 = null; self.f24 = null;
        self.f25 = 3; self.f26 = true;
        self.f27 = "c"; self.f28 = myAddress();
        self.f29 = emptyCell(); self.f30 = emptyCell().asSlice();
    }
}