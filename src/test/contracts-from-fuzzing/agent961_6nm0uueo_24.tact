struct OptionalCellStruct {
    cellData: Cell?;
}

contract OptionalCellInStruct {
    data: OptionalCellStruct;

    init() {
        self.data = OptionalCellStruct{ cellData: null };
    }
}