contract LargePersistent {
    f0: Int;
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Address;
    f7: Int?;
    f8: Bool?;
    f9: String?;
    f10: Cell?;
    f11: Slice?;
    f12: Address?;
    f13: Int;
    f14: Bool;
    f15: String;
    f16: Cell;
    f17: Slice;
    f18: Address;
    f19: Int?;

    init() {
        self.f0=0; self.f1=1; self.f2=true; self.f3="a"; self.f4=emptyCell(); self.f5=emptyCell().asSlice(); self.f6=myAddress();
        self.f7=null; self.f8=null; self.f9=null; self.f10=null; self.f11=null; self.f12=null;
        self.f13=2; self.f14=false; self.f15="b"; self.f16=emptyCell(); self.f17=emptyCell().asSlice(); self.f18=myAddress(); self.f19=null;
    }
}