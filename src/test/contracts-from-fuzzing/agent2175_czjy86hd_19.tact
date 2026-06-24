contract LotsOfDifferentTypes {
    i: Int;
    b: Bool;
    s: String;
    optI: Int?;
    optB: Bool?;
    optS: String?;
    a: Address;
    optA: Address?;
    c: Cell;
    sl: Slice;
    optC: Cell?;
    optSl: Slice?;

    init() {
        self.i=1; self.b=true; self.s="x";
        self.optI=2; self.optB=false; self.optS=null;
        self.a = myAddress(); self.optA=null;
        self.c=emptyCell(); self.sl=emptyCell().asSlice();
        self.optC=null; self.optSl=null;
    }
}