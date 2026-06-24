contract OptionalFields {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optSlice: Slice?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optString = null;
        self.optSlice = null;
    }
}