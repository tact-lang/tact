struct AddressWrap {
    addr: Address;
    descr: String;
}

struct CellWrap {
    cellData: Cell;
    comment: String;
}

struct CombinedRefs {
    aw: AddressWrap;
    cw: CellWrap;
}

contract RefStructTest {
    data: CombinedRefs;

    init() {
        self.data = CombinedRefs{
            aw: AddressWrap{ addr: myAddress(), descr: "me" },
            cw: CellWrap{ cellData: emptyCell(), comment: "none" },
        };
    }
}
