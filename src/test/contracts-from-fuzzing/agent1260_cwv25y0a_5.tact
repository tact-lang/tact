contract OptionalPrimitiveTest {
    optInt: Int?;
    optBool: Bool?;
    optCell: Cell?;
    optAddress: Address?;
    optString: String?;

    init() {
        self.optInt = 1;
        self.optBool = true;
        self.optCell = emptyCell();
        self.optAddress = myAddress();
        self.optString = "hello";
    }
}