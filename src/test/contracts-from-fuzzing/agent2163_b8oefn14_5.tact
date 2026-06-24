struct PlentyTypes {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    stringVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract MixedPersistent {
    data: PlentyTypes;

    init() {
        self.data = PlentyTypes{
            intVal: 5,
            boolVal: true,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            stringVal: "s",
            optInt: null,
            optBool: null,
            optStr: null
        };
    }
}