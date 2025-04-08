contract DefaultOptionals {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optString: String?;
    optCell: Cell?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optAddress = null;
        self.optString = null;
        self.optCell = null;
    }
}