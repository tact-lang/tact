contract MultipleOptionalPrimitives {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optCell: Cell?;
    optString: String?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optAddress = null;
        self.optCell = null;
        self.optString = null;
    }
}