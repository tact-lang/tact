contract OptionalPrimitives {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optStr: String?;
    optCell: Cell?;

    init() {
        self.optInt = 123;
        self.optBool = true;
        self.optAddr = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.optStr = "txt";
        self.optCell = emptyCell();
    }
}