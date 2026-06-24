contract OnlyOptional {
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
    optCell: Cell?;
    optAddress: Address?;

    init() {
        self.optInt = null;
        self.optStr = null;
        self.optBool = null;
        self.optCell = null;
        self.optAddress = null;
    }
}