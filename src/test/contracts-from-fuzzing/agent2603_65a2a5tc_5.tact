contract OptionalPrimitiveFields {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optAddress: Address?;
    optSlice: Slice?;
    optCell: Cell?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optString = null;
        self.optAddress = null;
        self.optSlice = null;
        self.optCell = null;
    }
}
