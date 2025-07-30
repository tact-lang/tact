contract TestContract {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optAddr: Address?;

    init() {
        self.optInt = null;
        self.optBool = true;
        self.optString = "hello";
        self.optAddr = null;
    }
}