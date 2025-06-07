struct HasCellRef {
    c: Cell;
    sl: Slice;
}

contract CellTest {
    data: HasCellRef;
    init() {
        self.data = HasCellRef {
            c: emptyCell(),
            sl: emptyCell().asSlice(),
        };
    }
}