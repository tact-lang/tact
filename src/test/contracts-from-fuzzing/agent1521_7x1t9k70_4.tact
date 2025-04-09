contract FuzzOptionalFields {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optSlice: Slice?;
    optCell: Cell?;
    optAddress: Address?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
        self.optSlice = null;
        self.optCell = null;
        self.optAddress = null;
    }
}