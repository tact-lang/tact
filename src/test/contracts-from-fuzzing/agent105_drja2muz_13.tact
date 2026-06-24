contract TestContract {
    optString: String?;
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optCell: Cell?;

    init() {
        self.optString = null;
        self.optInt = null;
        self.optBool = null;
        self.optAddress = null;
        self.optCell = null;
    }

    receive() {}
}