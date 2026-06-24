contract ManyOptionals {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optCell: Cell?;
    optSlice: Slice?;
    optAddr: Address?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optString = null;
        self.optCell = null;
        self.optSlice = null;
        self.optAddr = null;
    }
}