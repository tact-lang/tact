// Struct with slice and cell fields
struct SliceCellStruct {
    dataCell: Cell;
    dataSlice: Slice;
}

contract SliceCellTest {
    storage: SliceCellStruct;

    init() {
        self.storage = SliceCellStruct{
            dataCell: emptyCell(),
            dataSlice: emptyCell().asSlice()
        };
    }
}