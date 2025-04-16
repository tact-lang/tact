struct CellStuff {
    data: Cell;
    addr: Address;
    info: String;
}

contract CellVarsTest {
    s: CellStuff;

    init() {
        self.s = CellStuff{
            data:emptyCell(),
            addr:myAddress(),
            info:"hello"
        };
    }
}