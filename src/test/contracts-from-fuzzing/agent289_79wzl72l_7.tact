contract OptionalFlat {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optString: String?;
    optCell: Cell?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optAddr = null;
        self.optString = null;
        self.optCell = null;
    }
}