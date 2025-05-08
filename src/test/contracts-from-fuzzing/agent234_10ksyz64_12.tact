contract OptionalPrimitives {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optCell: Cell?;
    optBuilder: Builder?;
    optSlice: Slice?;
    optString: String?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optAddress = null;
        self.optCell = null;
        self.optBuilder = null;
        self.optSlice = null;
        self.optString = null;
    }
}