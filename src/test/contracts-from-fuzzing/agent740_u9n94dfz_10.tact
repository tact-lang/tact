struct WithString {
    text: String;
    number: Int;
    optNumber: Int?;
}

contract StringStructContract {
    content: WithString;

    init() {
        self.content = WithString{
            text: "hello",
            number: 42,
            optNumber: null,
        };
    }
}