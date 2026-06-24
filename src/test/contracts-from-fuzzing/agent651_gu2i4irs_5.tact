contract OptionalMix {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optString: String?;

    init() {
        self.optInt = null;
        self.optBool = true;
        self.optAddress = null;
        self.optCell = emptyCell();
        self.optSlice = null;
        self.optString = "abc";
    }
}