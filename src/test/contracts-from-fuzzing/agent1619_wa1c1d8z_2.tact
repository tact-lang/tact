struct LargeVarietyStruct {
    intVal: Int;
    boolVal: Bool;
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    stringVal: String;
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optBuilder: Builder?;
    optString: String?;
}

contract VarietyStorage {
    bigStruct: LargeVarietyStruct;
    
    init() {
        self.bigStruct = LargeVarietyStruct{
            intVal: 1,
            boolVal: true,
            addressVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
            stringVal: "test",
            optInt: null,
            optBool: null,
            optAddress: null,
            optCell: null,
            optSlice: null,
            optBuilder: null,
            optString: null,
        };
    }
}