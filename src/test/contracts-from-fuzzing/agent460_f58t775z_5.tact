contract OptTest {
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalAddr: Address?;
    optionalCell: Cell?;
    optionalSlice: Slice?;
    optionalString: String?;

    init() {
        self.optionalInt = null;
        self.optionalBool = true;
        self.optionalAddr = null;
        self.optionalCell = null;
        self.optionalSlice = null;
        self.optionalString = "hi";
    }
}
