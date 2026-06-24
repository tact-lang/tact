contract OptionalNullableTest {
    optionalString: String?;
    optionalBool: Bool?;
    optionalInt: Int?;

    init() {
        self.optionalString = null;
        self.optionalBool = null;
        self.optionalInt = null;
    }
}