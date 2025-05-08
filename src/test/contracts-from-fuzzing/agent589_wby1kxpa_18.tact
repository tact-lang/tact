struct AddrWrap {
    addr1: Address;
    addr2: Address?;
}

struct CellWrap {
    c1: Cell;
    c2: Cell?;
}

contract Mixed {
    aw: AddrWrap;
    cw: CellWrap;

    init() {
        self.aw = AddrWrap{
            addr1: myAddress(),
            addr2: null,
        };
        self.cw = CellWrap{
            c1: emptyCell(),
            c2: null,
        };
    }
}