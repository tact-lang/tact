struct OptionalString {
    comment: String?;
}

contract StrOptionalTest {
    s: OptionalString;

    init() {
        self.s = OptionalString{ comment: null };
    }
}