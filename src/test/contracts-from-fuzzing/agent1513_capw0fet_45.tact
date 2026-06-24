struct CellArray {
    c1: Cell;
    c2: Cell;
    c3: Cell;
    c4: Cell;
    c5: Cell;
}

contract CellsFive {
    val: CellArray;

    init() {
        self.val = CellArray{
            c1: emptyCell(), c2: emptyCell(),
            c3: emptyCell(), c4: emptyCell(), c5: emptyCell()
        };
    }
}