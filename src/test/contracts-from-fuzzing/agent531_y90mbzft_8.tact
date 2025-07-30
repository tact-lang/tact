contract JustOptionals {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeStr: String?;
    maybeSlice: Slice?;

    init() {
        self.maybeInt = null;
        self.maybeBool = true;
        self.maybeStr = null;
        self.maybeSlice = null;
    }
}