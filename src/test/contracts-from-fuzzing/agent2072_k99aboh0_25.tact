struct CellInStruct {
    c1: Cell;
    c2: Cell;
    s: String;
}

contract CellsInStructContract {
    data: CellInStruct;

    init() {
        self.data = CellInStruct{
            c1: emptyCell(),
            c2: emptyCell(),
            s: "x"
        };
    }
}