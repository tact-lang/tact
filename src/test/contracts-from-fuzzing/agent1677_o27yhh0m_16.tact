contract OptionalPrimitives {
    mayInt: Int?;
    mayBool: Bool?;
    mayAddress: Address?;

    init() {
        self.mayInt = null;
        self.mayBool = null;
        self.mayAddress = null;
    }
}