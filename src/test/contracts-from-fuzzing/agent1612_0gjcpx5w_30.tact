struct OptionalCell {
    c: Cell?;
}

contract OptionalCellField {
    opt: OptionalCell;

    init() {
        self.opt = OptionalCell{
            c: null
        };
    }
}
