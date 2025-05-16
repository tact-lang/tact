struct CellsSlicesAddresses {
    cl: Cell;
    sl: Slice;
    addr: Address;
}

contract ComplexRefs {
    data: CellsSlicesAddresses;

    init() {
        self.data = CellsSlicesAddresses{
            cl: emptyCell(),
            sl: emptyCell().asSlice(),
            addr: myAddress()
        };
    }
}