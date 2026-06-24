struct CellSlice {
    cel: Cell;
    optCel: Cell?;
    sli: Slice;
    optSli: Slice?;
}

contract TestContract {
    val: CellSlice;

    init() {
        self.val = CellSlice{
            cel: emptyCell(),
            optCel: null,
            sli: emptyCell().asSlice(),
            optSli: null,
        };
    }
}