struct OptionalCell {
    c: Cell?;
}

contract OptionalCellContract {
    oc: OptionalCell;

    init() {
        self.oc = OptionalCell{c: null};
    }
}