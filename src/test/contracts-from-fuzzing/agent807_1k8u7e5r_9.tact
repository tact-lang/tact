contract OptionalPrimitives {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optStr: String?;
    optCell: Cell?;
    optSlice: Slice?;
    init() {
        self.optInt = null;
        self.optBool = null;
        self.optAddr = null;
        self.optStr = null;
        self.optCell = null;
        self.optSlice = null;
    }
}