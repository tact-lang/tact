struct AddrNested {
    addr: Address;
}

struct CellNested {
    cell: Cell;
}

struct MoreNesting {
    innerAddr: AddrNested;
    innerCell: CellNested;
}

contract CombinedNestedTest {
    field: MoreNesting;

    init() {
        self.field = MoreNesting{
            innerAddr: AddrNested{ addr: myAddress() },
            innerCell: CellNested{ cell: emptyCell() }
        };
    }
}