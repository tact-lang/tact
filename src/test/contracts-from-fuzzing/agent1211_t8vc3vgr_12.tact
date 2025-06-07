struct OptionalCell {
    copt: Cell?;
}

contract OptionalCellContract {
    f: OptionalCell;
    init() {
        self.f = OptionalCell{
            copt: null,
        };
    }
}