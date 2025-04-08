contract OptFields {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optCell: Cell?;

    init() {
        self.optInt = 7;
        self.optBool = false;
        self.optStr = "hey";
        self.optCell = emptyCell();
    }
}