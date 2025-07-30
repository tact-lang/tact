struct CellNestedStruct {
    rawCell: Cell;
    nestedVal: NestedStruct;
}

struct NestedStruct {
    innerCell: Cell;
    number: Int;
}

contract Test {
    store: CellNestedStruct;

    init() {
        self.store = CellNestedStruct{
            rawCell: emptyCell(),
            nestedVal: NestedStruct{
                innerCell: emptyCell(),
                number: 100
            }
        };
    }
}
