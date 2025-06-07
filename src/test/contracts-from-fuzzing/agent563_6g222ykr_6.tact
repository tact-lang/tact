contract OptionalEdge {
    number: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optCell: Cell?;
    optString: String?;
    optSlice: Slice?;

    init() {
        self.number = null;
        self.optBool = null;
        self.optAddress = null;
        self.optCell = null;
        self.optString = null;
        self.optSlice = null;
    }
}