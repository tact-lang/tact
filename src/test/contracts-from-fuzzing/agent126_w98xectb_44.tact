struct WithString {
    s: String;
}

contract DeepString {
    nested: WithString;

    init() {
        self.nested = WithString{ s: "hello" };
    }
}