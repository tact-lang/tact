struct CellStruct {
    header: Cell;
}

contract CellNested {
    cell: CellStruct;

    init() {
        self.cell = CellStruct{
            header: beginCell().storeInt(42, 32).endCell()
        };
    }

    receive() {
        self.cell = CellStruct{
            header: beginCell().storeInt(24, 32).endCell()
        };
    }
}