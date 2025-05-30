contract TestContract {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optSlice: Slice?;
    optCell: Cell?;
    optAddress: Address?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optString = null;
        self.optSlice = null;
        self.optCell = null;
        self.optAddress = null;
    }
}