struct Complex {
    intField: Int;
    boolField: Bool;
    stringField: String;
    addressField: Address;
    cellField: Cell;
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalAddress: Address?;
    optionalCell: Cell?;
}

contract ComplexStorage {
    data: Complex;

    init() {
        self.data = Complex{
            intField: 1,
            boolField: true,
            stringField: "hello",
            addressField: myAddress(),
            cellField: emptyCell(),
            optionalInt: null,
            optionalBool: null,
            optionalAddress: null,
            optionalCell: null,
        };
    }
}