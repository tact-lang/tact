contract OptionalComplexPrimitives {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optAddress: Address?;
    optCell: Cell?;
    optSlice: Slice?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optString = null;
        self.optAddress = null;
        self.optCell = null;
        self.optSlice = null;
    }
}