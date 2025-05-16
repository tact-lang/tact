contract OptionalSliced {
    optAddr: Address?;
    optStr: String?;
    optSlice: Slice?;

    init() {
        self.optAddr = null;
        self.optStr = null;
        self.optSlice = null;
    }
}