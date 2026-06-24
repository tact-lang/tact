struct StructWithOptionalCell {
    data: Cell?;
}

contract OptionalCellStorage {
    s: StructWithOptionalCell;

    init() {
        self.s = StructWithOptionalCell{
            data: emptyCell()
        };
    }
}
