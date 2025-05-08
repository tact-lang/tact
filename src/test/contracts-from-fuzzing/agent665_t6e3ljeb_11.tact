contract BigFields {
    int1: Int; int2: Int; int3: Int; int4: Int; int5: Int;
    int6: Int; int7: Int; int8: Int; int9: Int; int10: Int;
    bool1: Bool; bool2: Bool; bool3: Bool; bool4: Bool; bool5: Bool;
    str1: String; str2: String; str3: String;
    addr1: Address; addr2: Address;
    cell1: Cell; cell2: Cell;
    slice1: Slice; slice2: Slice;

    init() {
        self.int1=1; self.int2=2; self.int3=3; self.int4=4; self.int5=5;
        self.int6=6; self.int7=7; self.int8=8; self.int9=9; self.int10=10;
        self.bool1=true; self.bool2=false; self.bool3=true; self.bool4=false; self.bool5=true;
        self.str1="a"; self.str2="b"; self.str3="c";
        self.addr1=myAddress(); self.addr2=myAddress();
        self.cell1=emptyCell(); self.cell2=emptyCell();
        self.slice1=emptyCell().asSlice(); self.slice2=emptyCell().asSlice();
    }
}
