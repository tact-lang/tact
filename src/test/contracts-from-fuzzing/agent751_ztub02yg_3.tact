contract OptionalPrimitives {
    oInt: Int?;
    oBool: Bool?;
    oAddr: Address?;
    oCell: Cell?;
    oSlice: Slice?;
    oStr: String?;

    init() {
        self.oInt = null;
        self.oBool = null;
        self.oAddr = null;
        self.oCell = null;
        self.oSlice = null;
        self.oStr = null;
    }
}