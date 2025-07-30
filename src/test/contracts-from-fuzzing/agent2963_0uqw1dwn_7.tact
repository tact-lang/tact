contract NestedOptionalPrimitives {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;

    init() {
        self.optInt = 7;
        self.optBool = null;
        self.optString = "hello";
    }
}
