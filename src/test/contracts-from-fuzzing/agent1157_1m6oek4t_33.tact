struct CellStuff {
    raw: Cell;
    sl: Slice;
    maybe: Cell?;
}

contract CellStructTest {
    data: CellStuff;

    init() {
        self.data = CellStuff{
            raw: emptyCell(),
            sl: emptyCell().asSlice(),
            maybe: null
        };
    }

    receive() {
        let tmp = self.data;
    }
}