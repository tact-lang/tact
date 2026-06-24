contract NullOptionals {
    optionalInt: Int?;
    optionalAddr: Address?;
    optionalCell: Cell?;
    optionalSlice: Slice?;
    optionalBool: Bool?;
    optionalString: String?;

    init() {
        self.optionalInt = null;
        self.optionalAddr = null;
        self.optionalCell = null;
        self.optionalSlice = null;
        self.optionalBool = null;
        self.optionalString = null;
    }
}