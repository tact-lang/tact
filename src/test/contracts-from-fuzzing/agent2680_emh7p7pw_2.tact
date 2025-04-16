struct Simple1 { a: Int; }
struct Simple2 { b: Bool; }

contract TooManyFields {
    f1: Int;
    f2: String;
    f3: Bool;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Builder;
    f8: Int?;
    f9: Bool?;
    f10: String;
    f11: Cell;
    f12: Int;
    f13: Address;
    f14: Bool;
    f15: Int;
    f16: String;
    f17: Simple1;
    f18: Simple2;
    f19: Int;
    f20: Bool;
    f21: String;
    f22: Address;
    f23: Cell;
    f24: Int;
    f25: Bool;
    f26: Int;
    f27: String;

    init() {
        self.f1 = 1;
        self.f2 = "a";
        self.f3 = true;
        self.f4 = myAddress();
        self.f5 = emptyCell();
        self.f6 = emptyCell().asSlice();
        self.f7 = beginCell();
        self.f8 = 42;
        self.f9 = false;
        self.f10 = "str";
        self.f11 = emptyCell();
        self.f12 = 12;
        self.f13 = myAddress();
        self.f14 = true;
        self.f15 = 5;
        self.f16 = "text";
        self.f17 = Simple1{a: 7};
        self.f18 = Simple2{b: false};
        self.f19 = 19;
        self.f20 = true;
        self.f21 = "twentyone";
        self.f22 = myAddress();
        self.f23 = emptyCell();
        self.f24 = 24;
        self.f25 = false;
        self.f26 = 26;
        self.f27 = "end";
    }
}