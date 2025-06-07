contract OptionalsInline {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optString: String?;
    optCell: Cell?;

    init() {
        self.optInt = 123;
        self.optBool = true;
        self.optAddress = null;
        self.optString = null;
        self.optCell = null;
    }
}