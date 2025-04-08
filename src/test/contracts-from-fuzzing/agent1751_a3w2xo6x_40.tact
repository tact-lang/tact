contract DirectPersistenceOptionals {
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;

    init() {
        self.optInt = null;
        self.optStr = null;
        self.optBool = null;
        self.optAddr = null;
        self.optCell = null;
        self.optSlice = null;
    }
}
