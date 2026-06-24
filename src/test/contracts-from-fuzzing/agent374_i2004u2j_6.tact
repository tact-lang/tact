struct ManyTypes {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    strField: String;
}

contract TestContract {
    m: ManyTypes;

    init() {
        self.m = ManyTypes{
            intField: 1,
            boolField: true,
            addrField: myAddress(),
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            strField: "test"
        };
    }

    receive() {
        let _ = self.m.boolField;
    }
}