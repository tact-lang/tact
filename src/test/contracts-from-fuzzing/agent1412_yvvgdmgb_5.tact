contract NullablePrimitives {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeAddr: Address?;

    init() {
        self.maybeInt = null;
        self.maybeBool = null;
        self.maybeAddr = null;
    }
}