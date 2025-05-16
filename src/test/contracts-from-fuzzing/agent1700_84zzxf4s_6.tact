contract TestOptionalFields {
    oInt: Int?;
    oBool: Bool?;
    oString: String?;
    oSlice: Slice?;
    oCell: Cell?;

    init() {
        self.oInt = 7;
        self.oBool = true;
        self.oString = "optional";
        self.oSlice = emptyCell().asSlice();
        self.oCell = emptyCell();
    }
}