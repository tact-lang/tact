contract LongFields {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Bool;
    f8: Cell;
    f9: Address;
    f10: Slice;
    f11: String;
    f12: Int?;
    f13: Bool?;
    f14: Slice?;
    f15: String?;
    f16: Address?;

    init() {
        self.f1=1; self.f2=2; self.f3=3; self.f4=4; self.f5=5; self.f6=6;
        self.f7=true; self.f8=emptyCell(); self.f9=myAddress(); self.f10=emptyCell().asSlice(); self.f11="hi";
        self.f12=null; self.f13=false; self.f14=null; self.f15=null; self.f16=null;
    }
}