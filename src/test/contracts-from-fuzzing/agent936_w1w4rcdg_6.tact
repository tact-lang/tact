struct Mixed {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    addressVal: Address;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optCell: Cell?;
    optSlice: Slice?;
    optAddress: Address?;
}

contract MixedFields {
    sf: Mixed;

    init() {
        self.sf = Mixed{
            intVal: 77,
            boolVal: true,
            stringVal: "test",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            addressVal: myAddress(),
            optInt: null,
            optBool: null,
            optString: null,
            optCell: null,
            optSlice: null,
            optAddress: null
        };
    }

    receive() {
        let _ = self.sf.intVal;
    }
}