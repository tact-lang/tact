contract OptionalFieldsInContract {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optSlice: Slice?;
    optCell: Cell?;
    optString: String?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optAddr = null;
        self.optSlice = null;
        self.optCell = null;
        self.optString = null;
    }
}