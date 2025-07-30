contract OptionalFields {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optBuilder: Builder?;
    optString: String?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optAddr = null;
        self.optCell = null;
        self.optSlice = null;
        self.optBuilder = null;
        self.optString = null;
    }
}