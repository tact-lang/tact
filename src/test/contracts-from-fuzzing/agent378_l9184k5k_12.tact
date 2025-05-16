struct WrappedString {
    text: String;
}

contract OptionalWrappedString {
    value: WrappedString?;

    init() {
        self.value = null;
    }
}