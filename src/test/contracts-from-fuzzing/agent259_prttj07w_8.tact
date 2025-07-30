contract OptionalRootFields {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optBuilder: Builder?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
        self.optAddr = null;
        self.optCell = null;
        self.optSlice = null;
        self.optBuilder = null;
    }
}
