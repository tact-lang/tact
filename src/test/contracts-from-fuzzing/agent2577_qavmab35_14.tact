contract TypeMix {
    a: Int as uint8;
    b: Int as int64;
    c: Bool;
    d: String;
    e: Address;
    f: Cell;
    g: Slice;

    init() {
        self.a=1; self.b=2; self.c=true;
        self.d="data"; self.e=myAddress();
        self.f=emptyCell(); self.g=emptyCell().asSlice();
    }
}
