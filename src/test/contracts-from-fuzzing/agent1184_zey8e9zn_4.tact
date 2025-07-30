struct SingleOptionalString {
    foo: String?;
}

contract OptionalStringTest {
    data: SingleOptionalString;

    init() {
        self.data = SingleOptionalString{ foo: null };
    }
}