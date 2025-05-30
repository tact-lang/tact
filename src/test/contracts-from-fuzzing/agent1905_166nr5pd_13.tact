struct SliceCellHolder {
    s: Slice;
    c: Cell;
}

contract SliceCellStorage {
    holder: SliceCellHolder;

    init() {
        self.holder = SliceCellHolder{
            s: emptyCell().asSlice(),
            c: emptyCell(),
        };
    }
}