struct SliceCell {
    s: Slice;
    c: Cell;
}

contract SlicesCells {
    val: SliceCell;

    init() {
        self.val = SliceCell{
            s: emptyCell().asSlice(),
            c: emptyCell()
        };
    }
}