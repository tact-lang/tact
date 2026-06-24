contract OptionalPrimitives {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optSlice: Slice?;
    optCell: Cell?;
    optAddr: Address?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optString = null;
        self.optSlice = null;
        self.optCell = null;
        self.optAddr = null;
    }
}
