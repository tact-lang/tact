contract OptionalPrimitiveFields {
    optBool: Bool?;
    optInt: Int?;
    optAddress: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optString: String?;

    init() {
        self.optBool = true;
        self.optInt = 12345;
        self.optAddress = null;
        self.optCell = emptyCell();
        self.optSlice = null;
        self.optString = "hello";
    }
}