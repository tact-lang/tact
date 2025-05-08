struct Child {
    val: Int;
}

contract OptionalNested {
    optField: Child?;
    optBool: Bool?;
    optInt: Int?;
    optStr: String?;

    init() {
        self.optField = null;
        self.optBool = null;
        self.optInt = null;
        self.optStr = null;
    }
}