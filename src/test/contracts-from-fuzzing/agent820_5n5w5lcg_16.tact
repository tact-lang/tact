struct DiverseFields {
    intVal: Int;
    strVal: String;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
    optAddr: Address?;
}

contract TestContract {
    d: DiverseFields;
    init() {
        self.d = DiverseFields{
            intVal: 123,
            strVal: "xyz",
            boolVal: false,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
            optInt: null,
            optStr: null,
            optBool: null,
            optAddr: null,
        };
    }
}