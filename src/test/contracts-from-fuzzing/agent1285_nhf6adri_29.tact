// Test optional at top-level contract field
contract TestContract {
    optInt: Int?;
    optAddr: Address?;
    optStr: String?;
    init() {
        self.optInt = null;
        self.optAddr = null;
        self.optStr = null;
    }
}