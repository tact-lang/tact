contract OptionalContractFieldsTest {
    ai: Int?;
    ab: Bool?;
    as1: String?;
    as2: Slice?;
    ac: Cell?;

    init() {
        self.ai = null;
        self.ab = true;
        self.as1 = "abc";
        self.as2 = emptyCell().asSlice();
        self.ac = emptyCell();
    }
}