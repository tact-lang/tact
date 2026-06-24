contract OptFields {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optString: String?;
    
    init() {
        self.optInt = 123;
        self.optBool = null;
        self.optAddress = null;
        self.optCell = emptyCell();
        self.optSlice = null;
        self.optString = "Hello";
    }
}