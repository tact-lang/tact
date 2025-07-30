contract OptionalInitializers {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeAddress: Address?;
    maybeCell: Cell?;
    maybeSlice: Slice?;
    maybeString: String?;

    init() {
        self.maybeInt = null;
        self.maybeBool = null;
        self.maybeAddress = null;
        self.maybeCell = null;
        self.maybeSlice = null;
        self.maybeString = null;
    }
}