contract OptionalDefaultsImplicit {
    optStr: String?;
    optSlice: Slice?;
    optCell: Cell?;
    optBool: Bool?;

    init() {
        self.optStr = null;
        self.optSlice = null;
        self.optCell = null;
        self.optBool = null;
    }

    receive() {}
}