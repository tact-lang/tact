struct CellSliceTest {
    a: Cell;
    b: Slice;
    c: Cell?;
    d: Slice?;
}

contract TestContract {
    data: CellSliceTest;

    init() {
        self.data = CellSliceTest{
            a: emptyCell(),
            b: emptyCell().asSlice(),
            c: null,
            d: null
        };
    }
}