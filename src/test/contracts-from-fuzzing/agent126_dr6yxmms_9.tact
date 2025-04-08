contract OptionalPrimitiveFields {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optCell: Cell?;
    optSlice: Slice?;
    optAddr: Address?;

    init() {
        self.optInt = null;
        self.optBool = true;
        self.optStr = null;
        self.optCell = null;
        self.optSlice = null;
        self.optAddr = null;
    }
}