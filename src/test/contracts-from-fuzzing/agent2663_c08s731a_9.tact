struct Mix {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    addrVal: Address;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract MixedFields {
    data: Mix;

    init() {
        self.data = Mix{
            intVal: 1,
            boolVal: true,
            stringVal: "hi",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
            addrVal: myAddress(),
            optInt: null,
            optBool: null,
            optStr: null
        };
    }
}