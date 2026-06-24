contract ManyTypedOptionals {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optSlice: Slice?;
    optCell: Cell?;
    optBuilder: Builder?;
    optString: String?;
    init() {
        self.optInt = null;
        self.optBool = null;
        self.optAddress = null;
        self.optSlice = null;
        self.optCell = null;
        self.optBuilder = null;
        self.optString = null;
    }
}