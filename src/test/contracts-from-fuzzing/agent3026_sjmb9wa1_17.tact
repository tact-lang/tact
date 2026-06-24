// Test long list of mixed primitive fields
contract ManyPrimitives {
    int1: Int;
    int2: Int;
    int3: Int;
    bool1: Bool;
    bool2: Bool;
    bool3: Bool;
    str1: String;
    str2: String;
    str3: String;
    cell1: Cell;
    cell2: Cell;
    cell3: Cell;
    slice1: Slice;
    slice2: Slice;
    slice3: Slice;
    addr1: Address;
    addr2: Address;
    addr3: Address;

    init() {
        self.int1=1; self.int2=2; self.int3=3;
        self.bool1=true; self.bool2=false; self.bool3=true;
        self.str1="a"; self.str2="b"; self.str3="c";
        self.cell1=emptyCell(); self.cell2=emptyCell(); self.cell3=emptyCell();
        self.slice1=emptyCell().asSlice(); self.slice2=emptyCell().asSlice(); self.slice3=emptyCell().asSlice();
        self.addr1=myAddress(); self.addr2=myAddress(); self.addr3=myAddress();
    }
}