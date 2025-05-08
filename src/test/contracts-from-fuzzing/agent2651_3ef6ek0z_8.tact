contract OptionalFieldContract {
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalString: String?;
    optionalAddress: Address?;
    optionalCell: Cell?;
    optionalSlice: Slice?;

    init() {
        self.optionalInt = null;
        self.optionalBool = null;
        self.optionalString = null;
        self.optionalAddress = null;
        self.optionalCell = null;
        self.optionalSlice = null;
    }
}