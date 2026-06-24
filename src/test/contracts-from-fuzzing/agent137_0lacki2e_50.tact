contract LargeCombi {
    start: Int;
    s1: String;
    s2: String;
    b1: Bool;
    b2: Bool;
    c1: Cell;
    c2: Cell;
    addr: Address;
    iend: Int;
    init() {
        self.start=0; self.s1="a"; self.s2="b"; self.b1=false; self.b2=true;
        self.c1 = emptyCell(); self.c2 = emptyCell();
        self.addr = myAddress(); self.iend=999;
    }
}