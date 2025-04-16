contract OptionalFields {
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalAddress: Address?;
    optionalCell: Cell?;
    optionalSlice: Slice?;
    optionalString: String?;

    init() {
        self.optionalInt = null;
        self.optionalBool = null;
        self.optionalAddress = null;
        self.optionalCell = null;
        self.optionalSlice = null;
        self.optionalString = null;
    }
}