struct CellSliceTest {
    c: Cell;
    s: Slice;
}

contract TestContract {
    data: CellSliceTest;

    init() {
        self.data = CellSliceTest{
            c: emptyCell(),
            s: emptyCell().asSlice()
        };
    }
}
