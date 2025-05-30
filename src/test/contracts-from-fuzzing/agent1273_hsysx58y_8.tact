struct MixTypes {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optStr: String?;
}

contract TestContract {
    mixed: MixTypes;

    init() {
        self.mixed = MixTypes{
            intVal: 1,
            boolVal: false,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            strVal: "hi",
            optInt: null,
            optBool: null,
            optAddr: null,
            optCell: null,
            optSlice: null,
            optStr: null
        };
    }
}