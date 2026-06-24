struct WithSliceCell {
    s: Slice;
    c: Cell;
    text: String;
}

contract StorageOfSlicesCells {
    obj: WithSliceCell;

    init() {
        self.obj = WithSliceCell{
            s: emptyCell().asSlice(),
            c: emptyCell(),
            text: "abc"
        };
    }
}
