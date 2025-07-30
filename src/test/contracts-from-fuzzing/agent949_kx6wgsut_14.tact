contract OnlyOptionals {
    optInt: Int?;
    optBool: Bool?;
    optSlice: Slice?;
    optAddress: Address?;
    optCell: Cell?;
    optString: String?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optSlice = null;
        self.optAddress = null;
        self.optCell = null;
        self.optString = null;
    }
}
