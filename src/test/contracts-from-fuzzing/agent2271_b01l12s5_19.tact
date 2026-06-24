struct CellStruct {
    cell: Cell;
    val: Int;
}

contract CellsInState {
    s: CellStruct;

    init() {
        self.s = CellStruct{
            cell: emptyCell(),
            val: 12,
        };
    }
}