struct ManyCells {
    c1: Cell;
    c2: Cell;
    c3: Cell;
    c4: Cell;
    c5: Cell;
}

contract TestContract {
    data: ManyCells;

    init() {
        let cell = emptyCell();
        self.data = ManyCells{
            c1:cell,c2:cell,c3:cell,c4:cell,c5:cell
        };
    }
}