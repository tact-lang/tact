struct SliceCellTest {
    s: Slice;
    c: Cell;
}

contract SliceCellFields {
    data: SliceCellTest;

    init() {
        self.data = SliceCellTest{
            s: emptyCell().asSlice(),
            c: emptyCell()
        };
    }
}