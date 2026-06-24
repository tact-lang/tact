struct SliceCellTest {
    s: Slice;
    c: Cell;
}

contract SliceCellContract {
    data: SliceCellTest;

    init() {
        self.data = SliceCellTest {
            s: emptyCell().asSlice(),
            c: emptyCell()
        };
    }
}