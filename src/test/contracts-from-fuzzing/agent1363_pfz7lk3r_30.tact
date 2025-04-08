struct StructWithCells {
    c1: Cell;
    c2: Cell;
    c3: Cell;
    c4: Cell;
}

contract StructCells {
    data: StructWithCells;

    init() {
        self.data = StructWithCells{
            c1: emptyCell(),
            c2: emptyCell(),
            c3: emptyCell(),
            c4: emptyCell(),
        };
    }
}