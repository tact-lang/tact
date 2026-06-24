contract Optionals {
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalAddress: Address?;
    optionalCell: Cell?;

    init() {
        self.optionalInt = null;
        self.optionalBool = null;
        self.optionalAddress = null;
        self.optionalCell = null;
    }
}