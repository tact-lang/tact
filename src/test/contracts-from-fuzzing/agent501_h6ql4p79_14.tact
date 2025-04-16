struct WithString {
    text: String;
}

contract StructWithString {
    content: WithString;

    init() {
        self.content = WithString{ text: "Some text" };
    }
}