struct CellWrap {
    f: Cell;
}

struct AddressWrap {
    f: Address;
}

contract ManyWraps {
    c: CellWrap;
    a: AddressWrap;
    
    init() {
        self.c = CellWrap{ f: emptyCell() };
        self.a = AddressWrap{ f: myAddress() };
    }
}