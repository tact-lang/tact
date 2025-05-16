contract OptionalPrimitives {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optSlice: Slice?;
    optCell: Cell?;
    optBuilder: Builder?;
    optStr: String?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optAddr = null;
        self.optSlice = null;
        self.optCell = null;
        self.optBuilder = null;
        self.optStr = null;
    }
}