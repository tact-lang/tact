struct WithCellAndSlice {
    cl: Cell;
    sl: Slice;
}

contract CellSliceTest {
    data: WithCellAndSlice;

    init() {
        self.data = WithCellAndSlice{
            cl: emptyCell(),
            sl: emptyCell().asSlice()
        };
    }
}