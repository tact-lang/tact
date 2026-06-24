contract OptionalBits {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optCell: Cell?;
    optAddress: Address?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
        self.optCell = null;
        self.optAddress = null;
    }
}