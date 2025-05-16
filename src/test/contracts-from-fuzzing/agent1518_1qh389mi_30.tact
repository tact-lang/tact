struct CellTest {
    c: Cell;
    s: Slice;
}

contract CellVals {
    val: CellTest;

    init() {
        let cl = emptyCell();
        self.val = CellTest{
            c: cl,
            s: cl.asSlice()
        };
    }
}