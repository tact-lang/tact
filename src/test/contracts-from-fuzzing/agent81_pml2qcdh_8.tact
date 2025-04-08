contract OptsTest {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;

    init() {
        self.optInt = null;
        self.optBool = false;
        self.optStr = null;
        self.optAddr = myAddress();
    }
}
