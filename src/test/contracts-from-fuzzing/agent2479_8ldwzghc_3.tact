contract OptionalsTest {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optSlice: Slice?;
    optCell: Cell?;
    optString: String?;
    init() {
        self.optInt = null;
        self.optBool = true;
        self.optAddr = null;
        self.optSlice = null;
        self.optCell = emptyCell();
        self.optString = "hi";
    }
}