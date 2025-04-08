struct VariedFields {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;

    oInt: Int?;
    oBool: Bool?;
    oString: String?;
    oAddr: Address?;
    oCell: Cell?;
    oSlice: Slice?;
}

contract TestContract {
    data: VariedFields;

    init() {
        self.data = VariedFields{
            intVal: 5,
            boolVal: true,
            stringVal: "hey",
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            oInt: null,
            oBool: null,
            oString: null,
            oAddr: null,
            oCell: null,
            oSlice: null
        };
    }
}