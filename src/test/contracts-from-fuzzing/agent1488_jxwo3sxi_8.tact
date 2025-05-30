contract OptionalFields {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optAddress: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optBuilder: Builder?;

    init() {
        self.optInt = null;
        self.optBool = true;
        self.optString = null;
        self.optAddress = myAddress();
        self.optCell = emptyCell();
        self.optSlice = emptyCell().asSlice();
        self.optBuilder = beginCell();
    }
}