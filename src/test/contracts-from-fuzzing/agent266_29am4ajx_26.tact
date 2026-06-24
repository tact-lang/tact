struct OptionalCell {
    c: Cell?;
}

contract OptionalCellField {
    data: OptionalCell;

    init() {
        self.data = OptionalCell{
            c: null
        };
    }
}