struct OptionalCellStruct {
    c: Cell?;
}

contract OptionalCellField {
    data: OptionalCellStruct;

    init() {
        self.data = OptionalCellStruct{ c: null };
    }
}
