contract OptOptField {
    optionalString: String?;
    optionalNumber: Int?;
    optionalBool: Bool?;
    
    init() {
        self.optionalString = null;
        self.optionalNumber = null;
        self.optionalBool = null;
    }
}