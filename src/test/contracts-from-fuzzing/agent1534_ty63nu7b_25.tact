contract NestedOptionalPrimitives {
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalAddr: Address?;
    optionalStr: String?;
    optionalCell: Cell?;

    init() {
        self.optionalInt = null;
        self.optionalBool = null;
        self.optionalAddr = null;
        self.optionalStr = null;
        self.optionalCell = null;
    }
}