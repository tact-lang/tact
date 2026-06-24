struct NullableFields {
    i: Int?;
    s: String?;
    b: Bool?;
    addr: Address?;
    cell: Cell?;
    sl: Slice?;
}

contract NullableVars {
    data: NullableFields;

    init() {
        self.data = NullableFields{
            i:null, s:null, b:null, addr:null, cell:null, sl:null
        };
    }
}
