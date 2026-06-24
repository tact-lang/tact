struct Wrap {
    a: Int;
}

contract Permutations {
    f1: Int; f2: Bool; f3: Int?; f4: Bool?; f5: String; f6: String?;
    f7: Cell; f8: Cell?; f9: Slice; f10: Slice?; f11: Address; f12: Address?;
    f13: Wrap; f14: Wrap?;

    init() {
        self.f1=1; self.f2=true; self.f3=null; self.f4=null; self.f5=""; self.f6=null;
        self.f7=emptyCell(); self.f8=null; self.f9=emptyCell().asSlice(); self.f10=null;
        self.f11=myAddress(); self.f12=null; self.f13=Wrap{a:1}; self.f14=null;
    }
}