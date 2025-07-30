struct HasStr {
    s: String;
}

contract OptionalNestedString {
    nested: HasStr?;
    init() {
        self.nested = HasStr{ s: "abc" };
    }
}