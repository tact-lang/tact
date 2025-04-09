contract LargePersistent {
    f1: Int; f2: Bool; f3: String; f4: Cell; f5: Slice;
    f6: Int; f7: Bool; f8: String; f9: Cell; f10: Slice;
    f11: Int; f12: Bool; f13: String; f14: Cell; f15: Slice;

    init() {
        self.f1=1; self.f2=true; self.f3="h"; self.f4=emptyCell(); self.f5=emptyCell().asSlice();
        self.f6=2; self.f7=false; self.f8="e"; self.f9=emptyCell(); self.f10=emptyCell().asSlice();
        self.f11=3; self.f12=true; self.f13="l"; self.f14=emptyCell(); self.f15=emptyCell().asSlice();
    }
}