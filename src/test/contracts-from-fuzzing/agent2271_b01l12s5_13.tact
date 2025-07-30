contract OptionalsOnRoot {
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalAddress: Address?;
    optionalCell: Cell?;
    optionalSlice: Slice?;
    optionalString: String?;

    init() {
        self.optionalInt = null;
        self.optionalBool = true;
        self.optionalAddress = null;
        self.optionalCell = emptyCell();
        self.optionalSlice = emptyCell().asSlice();
        self.optionalString = "abc";
    }
}