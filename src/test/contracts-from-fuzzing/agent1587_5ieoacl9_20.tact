contract ManyTypes {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;

    init() {
        self.i=1; self.b=true; self.s="s"; self.a=myAddress(); self.c=emptyCell(); self.sl=emptyCell().asSlice();
    }
}