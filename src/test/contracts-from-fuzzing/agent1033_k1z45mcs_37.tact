struct OptionalString {
    foo: String?;
    bar: Int;
}

contract OptStrStorage {
    val: OptionalString;

    init() {
        self.val = OptionalString{ foo: null, bar: 42 };
    }
}