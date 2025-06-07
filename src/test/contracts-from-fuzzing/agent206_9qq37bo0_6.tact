contract OptionalPrimitives {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optString: String?;
    optCell: Cell?;

    init() {
        self.optInt = null;
        self.optBool = false;
        self.optAddr = null;
        self.optString = "test";
        self.optCell = emptyCell();
    }
}
