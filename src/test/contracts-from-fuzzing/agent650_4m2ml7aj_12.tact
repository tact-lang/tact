// Long list of mixed field types
contract TestContract {
    int1: Int; int2: Int; int3: Int;
    bool1: Bool; bool2: Bool;
    addr1: Address; addr2: Address;
    cell1: Cell; cell2: Cell;
    slice1: Slice; slice2: Slice;
    str1: String; str2: String;

    init() {
        self.int1 = 1; self.int2 = 2; self.int3 = 3;
        self.bool1 = true; self.bool2 = false;
        self.addr1 = myAddress(); self.addr2 = myAddress();
        self.cell1 = emptyCell(); self.cell2 = emptyCell();
        self.slice1 = emptyCell().asSlice(); self.slice2 = emptyCell().asSlice();
        self.str1 = "hi"; self.str2 = "bye";
    }
}
