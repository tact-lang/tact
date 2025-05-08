contract OptTest {
    optionalInt: Int? = null;
    optionalBool: Bool? = null;
    optionalStr: String? = null;

    init() {
        self.optionalInt = 123;
        self.optionalBool = true;
        self.optionalStr = "hello";
    }
}