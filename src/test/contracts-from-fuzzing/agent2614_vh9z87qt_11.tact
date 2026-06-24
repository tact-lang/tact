contract LargeNumberPrimitives {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Bool;
    f5: String;
    f6: String;
    f7: Address;
    f8: Address;
    f9: Cell;
    f10: Cell;
    f11: Slice;
    f12: Slice;
    f13: Builder;
    f14: Builder;

    init() {
        self.f1=1; self.f2=2; self.f3=true; self.f4=false;
        self.f5="s1"; self.f6="s2";
        self.f7=myAddress(); self.f8=myAddress();
        self.f9=emptyCell(); self.f10=emptyCell();
        self.f11=emptyCell().asSlice(); self.f12=emptyCell().asSlice();
        self.f13=beginCell(); self.f14=beginCell();
    }
}