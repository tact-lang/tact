struct WithString {
    s: String;
    i: Int;
}

contract StringStructContract {
    data: WithString;

    init() {
        self.data = WithString{ s: "hello", i: 1 };
    }
}