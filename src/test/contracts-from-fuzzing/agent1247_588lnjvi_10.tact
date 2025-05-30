struct CellNested {
    c: Cell;
    s: Slice;
    addr: Address;
}

contract CellStructStorage {
    data: CellNested;

    init() {
        self.data = CellNested{
            c: emptyCell(),
            s: emptyCell().asSlice(),
            addr: myAddress()
        };
    }
}