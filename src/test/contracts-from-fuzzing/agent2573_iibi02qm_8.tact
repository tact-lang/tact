contract NullablePrimitives {
    nInt: Int?;
    nBool: Bool?;
    nString: String?;
    nAddress: Address?;
    nCell: Cell?;
    nSlice: Slice?;

    init() {
        self.nInt = null;
        self.nBool = null;
        self.nString = null;
        self.nAddress = null;
        self.nCell = null;
        self.nSlice = null;
    }
}