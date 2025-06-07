struct CellTest {
    a: Cell;
    b: Cell?;
}

contract CellTestContract {
    data: CellTest;

    init() {
        self.data = CellTest{
            a: emptyCell(),
            b: null,
        };
    }

    receive() {}
}