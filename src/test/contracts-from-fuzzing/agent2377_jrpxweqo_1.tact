contract MultipleOptionals {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optCell: Cell?;
    optSlice: Slice?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optAddress = null;
        self.optCell = null;
        self.optSlice = null;
    }
}