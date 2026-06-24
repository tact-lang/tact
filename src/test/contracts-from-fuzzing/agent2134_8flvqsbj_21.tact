struct CellAndOptionals {
    c1: Cell;
    c2: Cell?;
    c3: Cell?;
}

contract CellOptionalsTest{
    val: CellAndOptionals;

    init() {
        self.val = CellAndOptionals{
            c1: emptyCell(),
            c2: emptyCell(),
            c3: null
        };
    }
}