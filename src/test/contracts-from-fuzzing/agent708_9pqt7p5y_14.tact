contract LotsOfTypes {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
    p: Bool?;
    q: String?;
    c: Cell;
    sl: Slice;
    a: Address;

    init() {
        self.i=2; self.b=true; self.s="hi";
        self.o=3; self.p=null; self.q=null;
        self.c=emptyCell(); self.sl=emptyCell().asSlice(); self.a=myAddress();
    }
}
