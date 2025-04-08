struct ContainsSliceAndCell {
    s: Slice;
    c: Cell;
}

contract CellSliceFieldTest {
    val: ContainsSliceAndCell;

    init() {
        let cell = emptyCell();
        self.val = ContainsSliceAndCell {
            s: cell.asSlice(),
            c: cell
        };
    }
}