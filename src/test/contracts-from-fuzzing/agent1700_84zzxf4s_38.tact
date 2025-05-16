struct ContainsSliceCell {
    s: Slice;
    c: Cell;
}

contract StructSlicesCells {
    data: ContainsSliceCell;

    init() {
        self.data = ContainsSliceCell{
            s: emptyCell().asSlice(),
            c: emptyCell()
        };
    }
}
