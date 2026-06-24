struct Mixed {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    cellVal: Cell;
    sliceVal: Slice;
    addrVal: Address;
}

contract ComplexStorage {
    data: Mixed;
    init() {
        self.data = Mixed{
            intVal: 42,
            boolVal: true,
            strVal: "hello",
            optInt: null,
            optBool: false,
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            addrVal: myAddress()
        };
    }
}
