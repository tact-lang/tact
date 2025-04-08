contract LargePrimitives {
    int1: Int;
    bool1: Bool;
    addr1: Address;
    slice1: Slice;
    cell1: Cell;
    str1: String;

    int2: Int;
    bool2: Bool;
    addr2: Address;
    slice2: Slice;
    cell2: Cell;
    str2: String;

    int3: Int;
    bool3: Bool;
    addr3: Address;
    slice3: Slice;
    cell3: Cell;
    str3: String;

    init() {
        self.int1 = 1; self.bool1 = true; self.addr1 = myAddress(); self.slice1 = emptyCell().asSlice(); self.cell1 = emptyCell(); self.str1 = "a";
        self.int2 = 2; self.bool2 = false; self.addr2 = myAddress(); self.slice2 = emptyCell().asSlice(); self.cell2 = emptyCell(); self.str2 = "b";
        self.int3 = 3; self.bool3 = true; self.addr3 = myAddress(); self.slice3 = emptyCell().asSlice(); self.cell3 = emptyCell(); self.str3 = "c";
    }
}