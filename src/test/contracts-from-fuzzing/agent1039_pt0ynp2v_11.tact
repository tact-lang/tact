struct WithString {
    text: String;
    maybeText: String?;
}

contract TestContract {
    s: WithString;

    init() {
        self.s = WithString{
            text: "Hello",
            maybeText: null
        };
    }
}