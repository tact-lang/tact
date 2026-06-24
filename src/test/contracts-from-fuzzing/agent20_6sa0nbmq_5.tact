struct Complex {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    addrVal: Address;
    optInt: Int?;
    optBool: Bool?;
}

contract TestContract {
    record: Complex;

    init() {
        self.record = Complex{
            intVal: 1,
            boolVal: true,
            strVal: "Test",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            addrVal: myAddress(),
            optInt: null,
            optBool: true,
        };
    }
}
