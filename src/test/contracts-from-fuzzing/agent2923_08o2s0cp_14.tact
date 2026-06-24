contract DefaultEmptyOptionalVars {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optString: String?;
    optCell: Cell?;
    optSlice: Slice?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optAddr = null;
        self.optString = null;
        self.optCell = null;
        self.optSlice = null;
    }
}