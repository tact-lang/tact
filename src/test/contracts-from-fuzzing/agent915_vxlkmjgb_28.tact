struct WithString {
    s: String;
}

contract OptionalString {
    value: WithString?;

    init() {
        self.value = null;
    }
}
