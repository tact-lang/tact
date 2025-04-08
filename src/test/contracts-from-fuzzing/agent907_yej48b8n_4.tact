struct Complex {
    intField: Int;
    boolField: Bool;
    stringField: String;
    cellField: Cell;
    addressField: Address;
    sliceField: Slice;
    builderField: Builder;
    optInt: Int?;
    optBool: Bool?;
}

contract MixedTypes {
    persistent: Complex;

    init() {
        self.persistent = Complex{
            intField: 1,
            boolField: true,
            stringField: "x",
            cellField: emptyCell(),
            addressField: myAddress(),
            sliceField: emptyCell().asSlice(),
            builderField: beginCell(),
            optInt: null,
            optBool: false
        };
    }
}