contract ManyFields {
    f0: Int;
    f1: Bool;
    f2: String;
    f3: Int?;
    f4: Bool?;
    f5: String?;
    f6: Int as uint8;
    f7: Int as int16;
    f8: Int as uint32;
    f9: Int as int64;
    f10: Address;
    f11: Slice;
    f12: Cell;
    f13: Address?;
    f14: Slice?;
    f15: Cell?;
    f16: Int;
    f17: Bool;
    f18: String;
    f19: Int?;

    init() {
        self.f0=0; self.f1=false; self.f2=""; self.f3=null; self.f4=null;
        self.f5=null; self.f6=6; self.f7=7; self.f8=8; self.f9=9;
        self.f10=myAddress(); self.f11=emptyCell().asSlice(); self.f12=emptyCell();
        self.f13=null; self.f14=null; self.f15=null; self.f16=16; self.f17=true;
        self.f18="text"; self.f19=null;
    }
}