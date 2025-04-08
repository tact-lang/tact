struct HasString {
    s: String;
}

contract OptionalNestedString {
    val: HasString?;

    init() {
        self.val = null;
    }
}
