contract ManyPersistentPrimitives {
    int0: Int;
    int1: Int;
    int2: Int;
    bool0: Bool;
    bool1: Bool;
    bool2: Bool;
    str0: String;
    str1: String;
    str2: String;
    addr0: Address;
    addr1: Address;
    addr2: Address;
    cell0: Cell;
    cell1: Cell;
    cell2: Cell;
    slice0: Slice;
    slice1: Slice;
    slice2: Slice;

    init() {
        self.int0 = 1; self.int1=2; self.int2=3;
        self.bool0 = true; self.bool1=false; self.bool2=true;
        self.str0="a"; self.str1="b"; self.str2="c";
        self.addr0=myAddress(); self.addr1=myAddress(); self.addr2=myAddress();
        self.cell0=emptyCell(); self.cell1=emptyCell(); self.cell2=emptyCell();
        self.slice0=emptyCell().asSlice(); self.slice1=emptyCell().asSlice(); self.slice2=emptyCell().asSlice();
    }
}