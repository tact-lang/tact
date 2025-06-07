contract NullableEdgeCase {
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;

    init() {
        self.optInt = 0;
        self.optStr = null;
        self.optBool = true;
    }
}