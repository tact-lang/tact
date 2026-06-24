contract EdgeCase {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optStr: String?;
    optCell: Cell?;
    optSlice: Slice?;
    
    init() {
        self.optInt = null;
        self.optBool = false;
        self.optAddr = null;
        self.optStr = null;
        self.optCell = emptyCell();
        self.optSlice = emptyCell().asSlice();
    }
}