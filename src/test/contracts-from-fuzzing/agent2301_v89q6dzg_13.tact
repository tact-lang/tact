contract OptionalSomePrimitives {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optStr: String?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optAddr = null;
        self.optCell = null;
        self.optStr = null;
    }
}