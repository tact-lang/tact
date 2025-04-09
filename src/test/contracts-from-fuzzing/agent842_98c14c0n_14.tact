struct Combo {
    intField: Int;
    boolField: Bool;
    addressField: Address;
    stringField: String;
    cellField: Cell;
    sliceField: Slice;
    oIntField: Int?;
    oBoolField: Bool?;
    oAddressField: Address?;
    oStringField: String?;
    oCellField: Cell?;
    oSliceField: Slice?;
}

contract ComboContract {
    combined: Combo;

    init() {
        self.combined = Combo{
            intField:1,
            boolField:true,
            addressField:myAddress(),
            stringField:"abc",
            cellField:emptyCell(),
            sliceField:emptyCell().asSlice(),
            oIntField:null,
            oBoolField:null,
            oAddressField:null,
            oStringField:null,
            oCellField:null,
            oSliceField:null
        };
    }
}