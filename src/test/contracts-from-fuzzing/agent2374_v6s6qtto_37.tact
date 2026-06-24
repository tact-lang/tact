struct AddressWrap {
    addr: Address;
}

struct CellWrap {
    cell: Cell;
}

struct SliceWrap {
    slice: Slice;
}

contract WrappedRefs {
    a: AddressWrap;
    c: CellWrap;
    s: SliceWrap;

    init() {
        self.a = AddressWrap{addr: myAddress()};
        self.c = CellWrap{cell: emptyCell()};
        self.s = SliceWrap{slice: emptyCell().asSlice()};
    }
}