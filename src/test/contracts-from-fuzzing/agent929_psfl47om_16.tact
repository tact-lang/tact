contract InitAllNullOptionals {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optStr: String?;
    optCell: Cell?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optAddr = null;
        self.optStr = null;
        self.optCell = null;
    }
}