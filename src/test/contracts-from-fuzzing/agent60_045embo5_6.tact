contract TestContract {
    optInt: Int? = null;
    optBool: Bool? = null;
    optAddress: Address? = null;
    optCell: Cell? = null;
    optSlice: Slice? = null;
    optString: String? = null;

    init() {
        self.optInt = 1;
        self.optBool = true;
        self.optAddress = myAddress();
        self.optCell = emptyCell();
        self.optSlice = emptyCell().asSlice();
        self.optString = "hi";
    }

    receive() {}
}
