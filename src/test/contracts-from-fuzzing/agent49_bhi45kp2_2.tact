struct Complex {
    intField: Int;
    boolField: Bool;
    sliceField: Slice;
    cellField: Cell;
    addressField: Address;
    stringField: String;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract TestContract {
    state: Complex;

    init() {
        self.state = Complex{
            intField: 1,
            boolField: true,
            sliceField: emptyCell().asSlice(),
            cellField: emptyCell(),
            addressField: myAddress(),
            stringField: "hello",
            optInt: null,
            optBool: null,
            optString: null
        };
    }
}