contract MultipleOptionals {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optAddress: Address?;
    optSlice: Slice?;

    init() {
        self.optInt = 10;
        self.optBool = null;
        self.optString = null;
        self.optAddress = myAddress();
        self.optSlice = null;
    }
}