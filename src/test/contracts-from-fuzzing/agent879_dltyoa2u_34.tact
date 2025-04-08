contract ComboFields {
    a: Int;
    b: Bool?;
    c: String;
    d: Cell?;
    e: Slice;
    f: Address?;

    init() {
        self.a=1; self.b=null; self.c="abc"; self.d=null; self.e=emptyCell().asSlice(); self.f = null;
    }
}
