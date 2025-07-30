contract NestedOptionals {
    outer: Int?;
    innerBool: Bool?;
    innerString: String?;
    innerAddr: Address?;

    init() {
        self.outer = null;
        self.innerBool = null;
        self.innerString = null;
        self.innerAddr = null;
    }
}