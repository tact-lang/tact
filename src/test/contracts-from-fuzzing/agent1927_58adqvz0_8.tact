struct AddressHolder {
    addr: Address;
}

struct CellHolder {
    cellData: Cell;
}

contract MultiTypeTest {
    addrField: AddressHolder;
    cellField: CellHolder;
    intField: Int;
    boolField: Bool;
    stringField: String;

    init() {
        self.addrField = AddressHolder{ addr: myAddress() };
        self.cellField = CellHolder{ cellData: emptyCell() };
        self.intField = 42;
        self.boolField = true;
        self.stringField = "test";
    }
}