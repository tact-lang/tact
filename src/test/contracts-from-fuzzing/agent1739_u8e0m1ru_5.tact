struct Complex {
    intField: Int;
    boolField: Bool;
    stringField: String;
    addressField: Address;
    sliceField: Slice;
    cellField: Cell;
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    addressOpt: Address?;
    sliceOpt: Slice?;
    cellOpt: Cell?;
}

contract WideContract {
    data: Complex;

    init() {
        self.data = Complex{
            intField: 10,
            boolField: true,
            stringField: "str",
            addressField: myAddress(),
            sliceField: emptyCell().asSlice(),
            cellField: emptyCell(),
            intOpt: null,
            boolOpt: false,
            stringOpt: null,
            addressOpt: null,
            sliceOpt: null,
            cellOpt: null,
        };
    }
}