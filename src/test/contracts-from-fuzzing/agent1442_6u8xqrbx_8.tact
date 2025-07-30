contract TestContract {
    f1: Int; f2: String; f3: Bool; f4: Cell; f5: Slice; f6: Address; f7: Int?; f8: Bool?;
    init() {
        self.f1=1; self.f2="x"; self.f3=true; self.f4=emptyCell(); self.f5=emptyCell().asSlice(); self.f6=myAddress(); self.f7=null; self.f8=null;
    }
}