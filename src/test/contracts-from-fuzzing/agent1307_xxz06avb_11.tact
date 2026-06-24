contract OptionalFieldTest {
    optInt: Int? = null;
    optBool: Bool? = true;
    optStr: String? = null;

    init() {
        self.optInt = 100;
        self.optBool = null;
        self.optStr = "text";
    }
}