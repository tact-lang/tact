struct Simple {
    intField: Int;
    boolField: Bool;
    stringField: String;
    cellField: Cell;
    sliceField: Slice;
    addressField: Address;
}

contract TestContract {
    data: Simple;

    init() {
        self.data = Simple{
            intField: 1,
            boolField: true,
            stringField: "hi",
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            addressField: myAddress(),
        };
    }
}