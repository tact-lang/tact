struct SliceCellTest {
    s: Slice;
    c: Cell;
}

contract SCContract {
    data: SliceCellTest;

    init() {
        let empty = emptyCell();
        self.data = SliceCellTest{
            s: empty.asSlice(),
            c: empty,
        };
    }

    receive() {
        let newCell = emptyCell();
        self.data = SliceCellTest{
            s: newCell.asSlice(),
            c: newCell,
        };
    }
}
