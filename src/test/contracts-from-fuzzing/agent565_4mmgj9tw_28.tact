contract OnlyOptionalFields {
    val1: Int?;
    val2: String?;
    val3: Bool?;
    val4: Address?;
    
    init() {
        self.val1 = null;
        self.val2 = null;
        self.val3 = null;
        self.val4 = null;
    }
}