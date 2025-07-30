struct WithCellAndSlice {
    c: Cell;
    s: Slice;
}

contract CellSliceTest {
    data: WithCellAndSlice;

    init() {
        self.data = WithCellAndSlice{
            c: emptyCell(),
            s: emptyCell().asSlice(),
        };
    }
}