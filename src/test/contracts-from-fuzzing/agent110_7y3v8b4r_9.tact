contract PrimitiveOptionals {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;
    optCell: Cell?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
        self.optAddr = null;
        self.optCell = null;
    }
}