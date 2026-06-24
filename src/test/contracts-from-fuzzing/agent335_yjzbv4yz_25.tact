struct WithString {
    s: String;
}

contract StringFieldTest {
    data: WithString;

    init() {
        self.data = WithString{ s: "hello" };
    }
}
