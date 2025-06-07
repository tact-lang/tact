struct CellOptional {
    c: Cell?;
}

contract OptCellTest {
    val: CellOptional = CellOptional{
        c: null,
    };
}
