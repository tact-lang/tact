struct SliceCellStruct {
    s: Slice;
    c: Cell;
}

contract SliceCellFieldsTest {
    val: SliceCellStruct;

    init() {
        self.val = SliceCellStruct{
            s: emptyCell().asSlice(),
            c: emptyCell()
        };
    }
}