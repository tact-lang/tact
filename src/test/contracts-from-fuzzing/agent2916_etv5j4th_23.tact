contract ComplexOptionalContract {
    val1: Int?;
    str1: String?;
    addr1: Address?;
    bool1: Bool?;
    val2: Int;

    init() {
        self.val1 = null;
        self.str1 = null;
        self.addr1 = null;
        self.bool1 = null;
        self.val2 = 5;
    }
}