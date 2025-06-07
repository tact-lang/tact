struct MixStruct {
    intVal: Int;
    boolVal: Bool;
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    stringVal: String;
    optInt: Int?;
    optAddress: Address?;
    optString: String?;
}

contract MixedFields {
    data: MixStruct;
    init() {
        self.data = MixStruct{
            intVal: 1,
            boolVal: false,
            addressVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            stringVal: "hello",
            optInt: null,
            optAddress: null,
            optString: null,
        };
    }
}