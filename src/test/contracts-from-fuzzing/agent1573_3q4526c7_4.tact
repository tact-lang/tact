struct Complex {
    intField: Int;
    boolField: Bool;
    addressField: Address;
    stringField: String;
    cellField: Cell;
    sliceField: Slice;
}

contract TestContract {
    complex: Complex;

    init() {
        self.complex = Complex{
            intField: 1,
            boolField: true,
            addressField: myAddress(),
            stringField: "test",
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
        };
    }
}