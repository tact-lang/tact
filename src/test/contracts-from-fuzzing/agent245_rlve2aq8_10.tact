contract OptionalsPersistenceTest {
    optInt: Int?;
    optBool: Bool?;
    optCell: Cell?;
    optSlice: Slice?;
    optAddr: Address?;
    optStr: String?;

    init() {
        self.optInt = null;
        self.optBool = true;
        self.optCell = emptyCell();
        self.optSlice = emptyCell().asSlice();
        self.optAddr = null;
        self.optStr = null;
    }
}