struct An {
    s: String?;
}

contract NullableStringField {
    val: An;

    init() {
        self.val = An{ s: "abc" };
    }
}