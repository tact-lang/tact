struct CellWrap {
    c: Cell;
    s: Slice;
    cOpt: Cell?;
    sOpt: Slice?;
}

contract Test {
    val: CellWrap;

    init() {
        self.val = CellWrap{ c:emptyCell(), s:emptyCell().asSlice(), cOpt:null, sOpt:null };
    }
}