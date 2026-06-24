contract MultiOptionalStorage {
    optInt: Int?;
    optBool: Bool?;
    optSlice: Slice?;
    optAddress: Address?;
    optString: String?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optSlice = null;
        self.optAddress = null;
        self.optString = null;
    }
}