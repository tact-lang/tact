struct Complex {
    intVal: Int;
    boolVal: Bool;
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    stringVal: String;
    optInt: Int?;
    optBool: Bool?;
}

contract ComplexContract {
    state: Complex;

    init() {
        self.state = Complex{
            intVal: 1,
            boolVal: true,
            addressVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            stringVal: "test",
            optInt: null,
            optBool: false
        };
    }
}