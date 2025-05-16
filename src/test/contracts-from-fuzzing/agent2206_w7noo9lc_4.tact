contract Test4 {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optString: String?;

    init() {
        self.optInt = null;
        self.optBool = true;
        self.optAddr = null;
        self.optCell = emptyCell();
        self.optSlice = null;
        self.optString = "abc";
    }
}
