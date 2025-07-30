contract OptionalFields {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optAddress: Address?;
    optCell: Cell?;

    init() {
        self.optInt = null;
        self.optBool = true;
        self.optString = null;
        self.optAddress = myAddress();
        self.optCell = emptyCell();
    }
}