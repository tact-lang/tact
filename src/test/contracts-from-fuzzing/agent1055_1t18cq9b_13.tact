contract ManyOptionals {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optStr: String?;
    optSlice: Slice?;
    optCell: Cell?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optAddr = null;
        self.optStr = null;
        self.optSlice = null;
        self.optCell = null;
    }
}