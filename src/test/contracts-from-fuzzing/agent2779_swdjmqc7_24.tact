struct CellSliceCombo {
    c: Cell;
    s: Slice;
    str: String;
}

contract CellSliceTest {
    data: CellSliceCombo;
    init() {
        self.data = CellSliceCombo{
            c: emptyCell(),
            s: emptyCell().asSlice(),
            str: "abc"
        };
    }
}