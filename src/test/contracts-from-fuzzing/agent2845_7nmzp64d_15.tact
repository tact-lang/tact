struct WithString {
    txt: String;
}

contract StringFieldTest {
    content: WithString;

    init() {
        self.content = WithString{ txt: "hello world" };
    }
}