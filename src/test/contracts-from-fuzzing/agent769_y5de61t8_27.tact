struct CellStuff {
    cl: Cell;
    optCl: Cell?;
}

contract CellTest {
    data: CellStuff;
    init() {
        self.data = CellStuff{
            cl: emptyCell(),
            optCl: null
        };
    }
}