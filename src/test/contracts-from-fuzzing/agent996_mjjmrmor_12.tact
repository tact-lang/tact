struct MixStruct {
    intField: Int;
    boolField: Bool;
    strField: String;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optStr: String?;
}

contract TestStorage {
    mixed: MixStruct;

    init() {
        self.mixed = MixStruct{
            intField: 5,
            boolField: true,
            strField: "demo",
            addrField: myAddress(),
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            optInt: null,
            optBool: false,
            optAddr: null,
            optStr: null,
        };
    }
}