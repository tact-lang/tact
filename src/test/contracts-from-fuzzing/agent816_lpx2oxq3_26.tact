struct NestedRef {
    s: Cell;
}

contract RefStruct {
    field: NestedRef;

    init() {
        self.field = NestedRef{ s: emptyCell() };
    }
}
