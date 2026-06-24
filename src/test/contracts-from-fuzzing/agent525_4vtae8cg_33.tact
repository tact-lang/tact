struct CellNesting {
    inner: Cell;
    remain: Slice as remaining;
}

contract CellTail {
    val: CellNesting;
    init() {
        self.val = CellNesting{
            inner: emptyCell(),
            remain: emptyCell().asSlice(),
        };
    }
}