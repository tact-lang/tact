struct Mix {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    addressVal: Address;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optCell: Cell?;
    optSlice: Slice?;
    optAddr: Address?;
}

contract TestContract {
    data: Mix;

    init() {
        self.data = Mix{
            intVal: 42,
            boolVal: true,
            stringVal: "hello",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            addressVal: myAddress(),
            optInt: null,
            optBool: null,
            optStr: null,
            optCell: null,
            optSlice: null,
            optAddr: null
        };
    }
}