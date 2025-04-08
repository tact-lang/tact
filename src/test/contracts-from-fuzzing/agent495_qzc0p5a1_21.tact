struct OptionalString {
    foo: String?;
}

contract OptStringContract {
    val: OptionalString;

    init() {
        self.val = OptionalString{ foo: null };
    }
}