contract MaxOptionalPrimitiveContract {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optString: String?;

    init() {
        self.optInt = 1;
        self.optBool = true;
        self.optAddr = null;
        self.optCell = null;
        self.optSlice = null;
        self.optString = null;
    }
}