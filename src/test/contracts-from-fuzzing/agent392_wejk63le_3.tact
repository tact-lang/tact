struct Diverse {
    intVal: Int;
    boolVal: Bool;
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    stringVal: String;
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optString: String?;
}

contract TestContract {
    data: Diverse;

    init() {
        self.data = Diverse{
            intVal: 0,
            boolVal: false,
            addressVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            stringVal: "",
            optInt: null,
            optBool: null,
            optAddress: null,
            optCell: null,
            optSlice: null,
            optString: null,
        };
    }
}