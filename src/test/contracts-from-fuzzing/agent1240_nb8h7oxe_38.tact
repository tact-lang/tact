struct OptFields {
    intField: Int?;
    boolField: Bool?;
    addrField: Address?;
    cellField: Cell?;
    sliceField: Slice?;
    stringField: String?;
}

contract VariousOptFields {
    payload: OptFields;
    init() {
        self.payload = OptFields{
            intField:null,
            boolField:null,
            addrField:null,
            cellField:null,
            sliceField:null,
            stringField:null
        };
    }
}