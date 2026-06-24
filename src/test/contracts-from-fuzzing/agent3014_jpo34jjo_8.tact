struct Complex {
    intField: Int;
    boolField: Bool;
    strField: String;
    sliceField: Slice;
    cellField: Cell;
    builderField: Builder;
    addressField: Address;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            intField: 42,
            boolField: true,
            strField: "test",
            sliceField: emptyCell().asSlice(),
            cellField: emptyCell(),
            builderField: beginCell(),
            addressField: myAddress(),
        };
    }
}