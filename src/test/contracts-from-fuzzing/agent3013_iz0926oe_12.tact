struct NestedOptString {
    text: String?;
}

contract NullableStrings {
    val1: String?;
    val2: NestedOptString?;

    init() {
        self.val1 = null;
        self.val2 = null;
    }
}
