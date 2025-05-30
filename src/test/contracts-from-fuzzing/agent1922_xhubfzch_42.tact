contract AllPrimitive {
    x: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    bu: Builder;
    a: Address;

    init() {
        self.x=1; self.b=true; self.s="hi"; self.c=emptyCell(); self.sl=emptyCell().asSlice(); self.bu=beginCell(); self.a=myAddress();
    }
}