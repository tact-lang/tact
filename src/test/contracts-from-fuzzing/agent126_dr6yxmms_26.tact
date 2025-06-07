struct InnerStr {
    text: String;
}

contract DeepString {
    content: InnerStr;

    init() {
        self.content = InnerStr{
            text: "hello world"
        };
    }
}