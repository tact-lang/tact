contract OptionalFieldsTest {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;

    init() {
        self.optInt = 123;
        self.optBool = true;
        self.optString = "hello";
    }
}