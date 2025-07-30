// multiple optionals, mixture
contract Test {
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
    optAddr: Address?;

    init() {
        self.optInt = null;
        self.optStr = null;
        self.optBool = true;
        self.optAddr = myAddress();
    }
}