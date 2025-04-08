struct SliceCellCombo {
    s: Slice;
    c: Cell;
}

contract ComboPersist {
    data: SliceCellCombo;

    init() {
        self.data = SliceCellCombo{
            s: emptyCell().asSlice(),
            c: emptyCell()
        };
    }
}