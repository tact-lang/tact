struct Complex {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    addressVal: Address;
    optionalVal: Int?;
}

contract StructComplex {
    data: Complex;

    init() {
        self.data = Complex{
            intVal: 42,
            boolVal: false,
            stringVal: "a",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            addressVal: myAddress(),
            optionalVal: null,
        };
    }
}