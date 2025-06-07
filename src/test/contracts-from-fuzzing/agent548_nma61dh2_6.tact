contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: Int;
    f6: Bool;
    f7: Int?;
    f8: Bool?;
    f9: String;
    f10: String?;
    f11: Address;
    f12: Address?;
    f13: Cell;
    f14: Cell?;
    f15: Slice;
    f16: Slice?;

    init() {
        self.f1=1; self.f2=true; self.f3=null; self.f4=null;
        self.f5=2; self.f6=false; self.f7=null; self.f8=null;
        self.f9="test"; self.f10=null;
        self.f11=myAddress(); self.f12=null;
        self.f13=emptyCell(); self.f14=null;
        self.f15=emptyCell().asSlice(); self.f16=null;
    }
}