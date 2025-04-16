contract MultipleOptionals {
    optInt1: Int?;
    optBool: Bool?;
    optString: String?;
    optCell: Cell?;

    init() {
        self.optInt1 = 7;
        self.optBool = true;
        self.optString = "hi";
        self.optCell = emptyCell();
    }
}