contract EmptyOptionalFieldTest {
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.optInt = null;
        self.optBool = null;
    }

    receive() {
        self.optInt = 123;
        self.optBool = true;
    }
}