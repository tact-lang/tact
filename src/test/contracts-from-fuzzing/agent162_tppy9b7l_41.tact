struct OptionalString {
    s: String?;
}

contract OptionalStringInside {
    inner: OptionalString;
    init() {
        self.inner = OptionalString{ s: "hello" };
    }
}