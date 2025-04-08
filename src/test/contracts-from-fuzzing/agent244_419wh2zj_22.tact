// optional contract storage field of primitive type
contract OptionalPrimitive {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.optInt = null;
        self.optBool = true;
        self.optStr = "hello";
    }
}