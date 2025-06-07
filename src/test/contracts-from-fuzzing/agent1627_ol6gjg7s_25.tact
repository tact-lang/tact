struct StructWithCellSlice {
    c: Cell;
    s: Slice;
    optC: Cell?;
    optS: Slice?;
}

contract CellSliceFieldsContract {
    val: StructWithCellSlice;

    init() {
        self.val = StructWithCellSlice{
            c: emptyCell(),
            s: emptyCell().asSlice(),
            optC: null,
            optS: null
        };
    }
}
