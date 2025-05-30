contract Test9 {
    optInt: Int? = null;
    optBool: Bool? = null;
    optSlice: Slice? = null;
    optAddress: Address? = null;
    optCell: Cell? = null;
    optString: String? = null;

    init() {
        self.optInt = 7;
        self.optBool = true;
        self.optSlice = emptyCell().asSlice();
        self.optAddress = myAddress();
        self.optCell = emptyCell();
        self.optString = "test";
    }
}